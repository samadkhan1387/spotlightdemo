import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'VideoRecordPage.dart';

class MedicationPage extends StatefulWidget {
  const MedicationPage({super.key});

  @override
  _MedicationPageState createState() => _MedicationPageState();
}

class _MedicationPageState extends State<MedicationPage> {
  final List<Map<String, String>> medications = [
    {'time': 'MORNING', 'name': 'Glipizide', 'dose': '5mg', 'icon': '☀️'},
    {'time': 'EVENING', 'name': 'Pulmicort', 'dose': '5mg', 'icon': '🌙'},
    {'time': 'NIGHT', 'name': 'Flovent', 'dose': '2 puffs', 'icon': '🌜'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 60),
              child: Text(
                'Welcome to Medications',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF4A4E65),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "You's Today Medications.",
                style: TextStyle(
                  color: Color(0xFF4A4E65),
                  fontSize: 18,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 40.0 ,vertical: 80),
                itemCount: medications.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey.shade200,
                      child: Text(
                        medications[index]['icon']!,
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                    title: Text(
                      medications[index]['name']!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4A4E65),
                      ),
                    ),
                    subtitle: Text(
                      "${medications[index]['time']} - ${medications[index]['dose']}",
                      style: const TextStyle(
                        color: Color(0xFF999999),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const VideoRecordPage())
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFBB168),
                  minimumSize: const Size(300, 60), // Button width and height
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Check In',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            // Bottom navigation with reduced height
            // BottomAppBar(
            //   color: const Color(0xFFFBB168),
            //   child: Container(
            //     height: 80, // Adjust height here
            //     child: Row(
            //       children: [
            //         Expanded(
            //           child: TextButton(
            //             onPressed: () {
            //               Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (context) => NavbarhomePage()),
            //               );
            //             },
            //             child: const Text(
            //               'BACK',
            //               style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 18,
            //               ),
            //             ),
            //           ),
            //         ),
            //         Container(
            //           width: 1,
            //           height: 50, // Adjust height to match the container
            //           color: Colors.white,
            //         ),
            //         Expanded(
            //           child: TextButton(
            //             onPressed: () {
            //               Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (context) => CameraScreen()),
            //               );
            //             },
            //             child: const Text(
            //               'NEXT',
            //               style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 18,
            //               ),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
