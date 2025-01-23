import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Medications.dart';
import 'Symptoms.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, // This removes the back button
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Spotlight',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.notifications),
                  color: Colors.black,
                  onPressed: () {
                    // Handle notification click
                  },
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: const Text(
                      '1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Image of a person on a bike (Replace with your asset)
              Center(
                child: Image.asset(
                  'assets/exercise.jpg',  // Replace with your actual asset
                  height: 220,
                ),
              ),
              const SizedBox(height: 20),
              // Greeting Text
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 28, color: Colors.black),
                  children: [
                    TextSpan(text: 'Good ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: 'Morning,\n'),
                    TextSpan(text: 'John', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'The journey to better health starts with that first step.',
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 24),
              Center(
                child: SizedBox(
                  width: 150, // Makes the button stretch across the screen width
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => const SymptomPage()
                      )
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFBB168), // Yellow color
                      padding: const EdgeInsets.symmetric(vertical: 16), // Adjust height
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // Rounded corners
                      ),
                      minimumSize: const Size(200, 50), // Minimum button size (width, height)
                    ),
                    child: const Text(
                      'Check In',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: SizedBox(
                  width: 280, // Makes the button stretch across the screen width
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => const MedicationPage()
                      )
                      );

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Yellow color
                      padding: const EdgeInsets.symmetric(vertical: 16), // Adjust height
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // Rounded corners
                      ),
                      side: const BorderSide(color: Colors.black12),
                      minimumSize: const Size(200, 50), // Minimum button size (width, height)
                    ),
                    child: const Text(
                      "View Today's Medication",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
