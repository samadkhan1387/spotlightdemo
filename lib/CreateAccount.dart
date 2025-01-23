import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

import 'loginPage.dart';  // For controlling the status bar

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController cnicController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true; // Track password visibility

  @override
  Widget build(BuildContext context) {

    // Set the status bar color to match the background
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white, // Match your background color
        statusBarIconBrightness: Brightness.dark, // Use light icons for dark backgrounds
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.055,  // Adjust height as needed
              ),
              // Title and Version
              Column(
                children: [
                  const SizedBox(height: 5),
                  Text(
                    'Create Account',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const SizedBox(height: 4),
                  const Text(
                    'First, help us verify your Identity',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Form for validation
              Form(
                key: _formKey, // Attach the form key
                child: Column(
                  children: [
                    // Full Name TextFormField
                    TextFormField(
                      controller: fullNameController,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.person, color: Color(0xFF4A4E65)),
                        labelText: 'Full Name*',
                        labelStyle: const TextStyle(color: Color(0xFF4A4E65)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFFFBB168),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFF4A4E65),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFFFBB168),
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      ),
                      cursorColor: const Color(0xFF818285),
                      style: const TextStyle(color: Color(0xFF4A4E65)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 25),
                    // Email TextFormField
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.email, color: Color(0xFF4A4E65)), // Icon on the right
                        labelText: 'Email*',
                        labelStyle: const TextStyle(color: Color(0xFF4A4E65)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFFFBB168),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFF4A4E65),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFFFBB168),
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      ),
                      cursorColor: const Color(0xFF818285),
                      style: const TextStyle(color: Color(0xFF4A4E65)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 25),
                    // Password TextFormField
                    TextFormField(
                      controller: passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        labelText: 'Password*',
                        labelStyle: const TextStyle(color: Color(0xFF4A4E65)),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword ? Icons.visibility_off : Icons.visibility,
                            color: const Color(0xFF4A4E65),
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFFFBB168),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFF4A4E65),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFFFBB168),
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      ),
                      cursorColor: const Color(0xFF818285),
                      style: const TextStyle(color: Color(0xFF4A4E65)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        } else if (value.length < 8) {
                          return 'Password must be at least 8 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 25),
                    // Phone Number TextFormField
                    TextFormField(
                      controller: phoneNumberController,
                      keyboardType: TextInputType.phone,
                      maxLength: 11,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.phone, color: Color(0xFF4A4E65)),
                        labelText: 'Phone Number*',
                        labelStyle: const TextStyle(color: Color(0xFF4A4E65)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFFFBB168),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFF4A4E65),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFFFBB168),
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        counterText: '', // Hide the counter text
                      ),
                      cursorColor: const Color(0xFF818285),
                      style: const TextStyle(color: Color(0xFF4A4E65)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        if (value.length != 11) {
                          return 'Phone number must be 11 digits';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: cnicController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.credit_card, color: Color(0xFF4A4E65)),
                        labelText: 'CNIC*',
                        labelStyle: const TextStyle(color: Color(0xFF4A4E65)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFFFBB168),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFF4A4E65),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFFFBB168),
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      cursorColor: const Color(0xFF818285),
                      style: const TextStyle(color: Color(0xFF4A4E65)),
                      inputFormatters: [
                        // This input formatter adds dashes at the correct positions
                        LengthLimitingTextInputFormatter(15),
                        TextInputFormatter.withFunction((oldValue, newValue) {
                          String newText = newValue.text.replaceAll('-', '');
                          if (newText.length > 5) {
                            newText = newText.substring(0, 5) + '-' + newText.substring(5);
                          }
                          if (newText.length > 13) {
                            newText = newText.substring(0, 13) + '-' + newText.substring(13);
                          }
                          return newValue.copyWith(
                            text: newText,
                            selection: TextSelection.collapsed(offset: newText.length),
                          );
                        }),
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your CNIC';
                        } else if (value.length != 15) {
                          return 'Please enter a valid 13-digit CNIC with dashes';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    // Sign Up Button
                    // Sign Up Button
                    SizedBox(
                      width: double.infinity, // Makes the button stretch across the screen width
                      child: ElevatedButton(
                        onPressed: () {
                          // Validate form fields
                          if (_formKey.currentState!.validate()) {
                            // Proceed with sign-up action if valid
                          }
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
                          'Sign Up',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                    // Sign In Text
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                        child: const Text.rich(
                          TextSpan(
                            text: "Already have an account? ",
                            style: TextStyle(color: Colors.black54),
                            children: [
                              TextSpan(
                                text: 'Sign In',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // HIPAA secure and private
                    const Column(
                      children: [
                        Icon(
                          Icons.lock,
                          color: Colors.black38,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Your information is HIPAA-secure and private',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black38,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,  // Adjust height
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
