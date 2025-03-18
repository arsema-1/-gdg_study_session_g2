import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text("Create New Account",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal)),
                  ),
                  SizedBox(height: 20),
                  Text("Full Name"),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter Your Full Name",
                        border: OutlineInputBorder()),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your full name' : null,
                  ),
                  SizedBox(height: 15),
                  Text("Password"),
                  TextFormField(
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      hintText: "Enter Your Password",
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(_obscureText
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () =>
                            setState(() => _obscureText = !_obscureText),
                      ),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your password' : null,
                  ),
                  SizedBox(height: 15),
                  Text("Email"),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter Your Email",
                        border: OutlineInputBorder()),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your email' : null,
                  ),
                  SizedBox(height: 15),
                  Text("Mobile Number"),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter Your Phone Number",
                        border: OutlineInputBorder()),
                    validator: (value) => value!.isEmpty
                        ? 'Please enter your phone number'
                        : null,
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Perform sign-up action
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Text("Sign Up",
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                      child: Text("OR",
                          style: TextStyle(fontSize: 16, color: Colors.grey))),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: FaIcon(FontAwesomeIcons.facebook,
                            color: Colors.blue, size: 30),
                      ),
                      SizedBox(width: 20),
                      IconButton(
                        onPressed: () {},
                        icon: FaIcon(FontAwesomeIcons.google,
                            color: Colors.red, size: 30),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text("Already have an account? Sign In",
                          style: TextStyle(
                              color: Colors.teal, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
