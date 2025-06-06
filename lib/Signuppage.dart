// sign_up_screen.dart
import 'package:flutter/material.dart';
import 'input_field.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void _validateAndSignUp() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Account Created Successfully!")),
      );
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirm password is required';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/pic2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Form container
          Align(
          alignment: Alignment.bottomCenter,
          child: SingleChildScrollView(
          child: Container(
          height: MediaQuery.of(context).size.height * 0.60,
          decoration: BoxDecoration(
          color: Colors.deepPurpleAccent,
          borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
          ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          child: Form(
          key: _formKey,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // You can perform any action here, for example:
                            print("Sign In text tapped");
                            // Or navigate somewhere:
                             Navigator.pushNamed(context, '/signin'); // if needed
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/signup');
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    // Email
                    InputField(
                      icon: Icons.email,
                      hintText: "Email Address",
                      controller: _emailController,
                      isPassword: false,
                      validator: _validateEmail,
                    ),
                    SizedBox(height: 10),

                    // Password
                    InputField(
                      icon: Icons.lock,
                      hintText: "Password",
                      controller: _passwordController,
                      isPassword: true,
                      validator: _validatePassword,
                    ),
                    SizedBox(height: 10),

                    // Confirm Password
                    InputField(
                      icon: Icons.lock,
                      hintText: "Confirm Password",
                      controller: _confirmPasswordController,
                      isPassword: true,
                      validator: _validateConfirmPassword,
                    ),
                    SizedBox(height: 20),

                    // Sign Up button
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: _validateAndSignUp,
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    Center(
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    // Center(
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       Navigator.pushNamed(context, '/signin'); // Or use `MaterialPageRoute` if needed
                    //     },
                    //     child: Text(
                    //       "Already have an account? Sign In",
                    //       style: TextStyle(
                    //         color: Colors.white,
                    //         decoration: TextDecoration.underline,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //   ),
                    // ),

                  ],
                ),
              ),
            ),
          ),
          ),
        ],
      ),
    );
  }
}
