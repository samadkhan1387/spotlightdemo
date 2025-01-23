import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'NavBarHome.dart';

class SuccessfullPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Navigate to NavbarhomePage when the back button is pressed
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => NavbarhomePage()),
        );
        return false; // Prevents the default back navigation
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => NavbarhomePage()),
              );
            },
          ),
          title: const Text('Preview Video', style: TextStyle(fontSize: 20),),
          backgroundColor: const Color(0xFFFBB168),

        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/checked.png', // Replace with your actual asset path
                height: 80,
              ),
              const SizedBox(height: 20),
              Text(
                'Video Submitted Successfully',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4A4E65),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
