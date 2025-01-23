import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Medications.dart';
import 'Medications2.dart';
import 'NavBarHome.dart';
import 'VideoRecordPage.dart'; // Import the new VideoRecordPage

class SymptomPage extends StatefulWidget {
  const SymptomPage({super.key});

  @override
  _SymptomPageState createState() => _SymptomPageState();
}

class _SymptomPageState extends State<SymptomPage> {
  final List<String> symptoms = [
    'None',
    'Abdominal pain',
    'Diarrhea',
    'Dizziness',
    'Chills',
    'Cough',
    'Headache',
    'Fatigue',
    'Fever',
    'Joint pain',
    'Loss of appetite',
    'Nausea',
    'Night Sweats',
    'Rash or Itching',
    'Vision change'
  ];

  Map<String, bool> selectedSymptoms = {};

  @override
  void initState() {
    super.initState();
    for (var symptom in symptoms) {
      selectedSymptoms[symptom] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Text(
                'Experiencing symptoms or side effects?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF4A4E65),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 60.0),
                itemCount: symptoms.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    activeColor: Color(0xFFFBB168),
                    title: Text(symptoms[index]),
                    contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
                    value: selectedSymptoms[symptoms[index]],
                    onChanged: (bool? value) {
                      setState(() {
                        selectedSymptoms[symptoms[index]] = value!;
                      });
                    },
                  );
                },
              ),
            ),

            // Bottom navigation with reduced height
            BottomAppBar(
              color: const Color(0xFFFBB168),
              child: Container(
                height: 80,
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => NavbarhomePage())
                          );
                        },
                        child: const Text(
                          'BACK',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 50,
                      color: Colors.white,
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Medication2Page())
                          );
                        },
                        child: const Text(
                          'NEXT',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
