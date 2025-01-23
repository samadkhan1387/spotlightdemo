import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'dart:io';

import 'VideoPreviewPage.dart';

class VideoRecordPage extends StatefulWidget {
  const VideoRecordPage({super.key});

  @override
  _VideoRecordPageState createState() => _VideoRecordPageState();
}

class _VideoRecordPageState extends State<VideoRecordPage> {
  List<CameraDescription> cameras = [];
  CameraController? _cameraController;
  bool isRecording = false;
  bool isFrontCamera = true;
  String elapsedTime = '00:00';
  Timer? _timer;
  int _start = 0;
  XFile? recordedFile;

  @override
  void initState() {
    super.initState();
    _initializeCamera(isFrontCamera);
  }

  Future<void> _initializeCamera(bool isFront) async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      cameras = await availableCameras();
      final selectedCamera = isFront
          ? cameras.firstWhere((camera) => camera.lensDirection == CameraLensDirection.front)
          : cameras.firstWhere((camera) => camera.lensDirection == CameraLensDirection.back);
      _cameraController = CameraController(selectedCamera, ResolutionPreset.high);

      await _cameraController?.initialize();
      setState(() {});
    } on CameraException catch (e) {
      print('Error initializing camera: $e');
    }
  }

  Future<void> _startVideoRecording() async {
    if (_cameraController != null && _cameraController!.value.isInitialized && !_cameraController!.value.isRecordingVideo) {
      try {
        recordedFile = null; // Reset recorded file
        await _cameraController?.startVideoRecording();

        _startTimer();
        setState(() {
          isRecording = true;
        });
      } on CameraException catch (e) {
        print('Error starting video recording: $e');
      }
    }
  }

  Future<void> _stopVideoRecording() async {
    if (_cameraController != null && _cameraController!.value.isRecordingVideo) {
      try {
        recordedFile = await _cameraController?.stopVideoRecording();
        _stopTimer();
        setState(() {
          isRecording = false;
        });

        if (recordedFile != null) {
          final directory = await getTemporaryDirectory();
          final newPath = '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.mp4';
          final File newFile = await File(recordedFile!.path).copy(newPath);

          bool? success = await GallerySaver.saveVideo(newFile.path).catchError((e) {
            print('Error Saving Video: $e');
            return false;
          });

          if (success == true) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Center(child: Text('Video Saved to Gallery'))),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Center(child: Text('Failed to Save Video.'))),
            );
          }

          // Navigate to the preview page after saving
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VideoPreviewPage(videoPath: newFile.path),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Center(child: Text('No Video File to Save.'))),
          );
        }
      } on CameraException catch (e) {
        print('Error stopping video recording: $e');
      }
    }
  }


  //
  // Future<void> _stopVideoRecording() async {
  //   if (_cameraController != null && _cameraController!.value.isRecordingVideo) {
  //     try {
  //       recordedFile = await _cameraController?.stopVideoRecording();
  //       _stopTimer();
  //       setState(() {
  //         isRecording = false;
  //       });
  //
  //       if (recordedFile != null) {
  //         final directory = await getTemporaryDirectory();
  //         final newPath = '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.mp4';
  //         final File newFile = await File(recordedFile!.path).copy(newPath);
  //
  //         bool? success = await GallerySaver.saveVideo(newFile.path).catchError((e) {
  //           print('Error Saving Video: $e');
  //           // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error saving video: $e')));
  //           return false;
  //         });
  //
  //         if (success == true) {
  //           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Center(child: Text('Video Saved to Gallery'))));
  //         } else {
  //           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Center(child: Text('Failed to Save Video.'))));
  //         }
  //       } else {
  //         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Center(child: Text('No video File to Save.'))));
  //       }
  //
  //       Navigator.pop(context);
  //     } on CameraException catch (e) {
  //       print('Error stopping video recording: $e');
  //     }
  //   }
  // }

  void _startTimer() {
    _start = 0;
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        _start++;
        final minutes = (_start ~/ 60).toString().padLeft(2, '0');
        final seconds = (_start % 60).toString().padLeft(2, '0');
        elapsedTime = '$minutes:$seconds';
      });
    });
  }

  void _stopTimer() {
    if (_timer != null) {
      _timer!.cancel();
      elapsedTime = '00:00';
    }
  }

  void _switchCamera() async {
    setState(() {
      isFrontCamera = !isFrontCamera;
    });
    await _cameraController?.dispose();
    _initializeCamera(isFrontCamera);
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   backgroundColor: const Color(0xFFFBB168),  // Set background color
      //   title: const Text(
      //     'Record Video',
      //     style: TextStyle(fontSize: 18),  // Set text size to 12
      //   ),
      // ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: _cameraController != null && _cameraController!.value.isInitialized
                ? Transform(
              alignment: Alignment.center,
              transform: isFrontCamera ? Matrix4.rotationY(3.14159) : Matrix4.identity(),
              child: CameraPreview(_cameraController!),
            )
                : const Center(child: CircularProgressIndicator(color: Color(0xFFFBB168))),
          ),
          // Controls section taking up 1/4 of the screen
          Container(
            color: Colors.black,
            height: MediaQuery.of(context).size.height / 7,
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (isRecording)
                  Positioned(
                    top: 6,
                    child: Text(
                      elapsedTime,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                // Record button at the bottom center
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: FloatingActionButton(
                      onPressed: isRecording ? _stopVideoRecording : _startVideoRecording,
                      backgroundColor: isRecording ? Colors.red : const Color(0xFFFBB168),
                      child: Icon(isRecording ? Icons.stop : Icons.videocam),
                    ),
                  ),
                ),
                // Camera flip button at the bottom right
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: FloatingActionButton(
                    onPressed: _switchCamera,
                    backgroundColor: Colors.grey,
                    child: const Icon(Icons.cameraswitch),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
