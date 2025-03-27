import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'bloc/sign_up_bloc.dart'; // Import your BLoC

class SignUpScreen extends StatelessWidget {
  final _fullNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: Scaffold(
        body: BlocConsumer<SignUpBloc, SignUpState>(
          listener: (context, state) {
            if (state.status == SignUpStatus.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Sign Up Successful!')),
              );
            } else if (state.status == SignUpStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage)),
              );
            }
          },
          builder: (context, state) {
            return Padding(
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
                          controller: _fullNameController,
                          decoration: InputDecoration(
                              hintText: "Enter Your Full Name",
                              border: OutlineInputBorder()),
                          validator: (value) => value!.isEmpty
                              ? 'Please enter your full name'
                              : null,
                          onChanged: (value) => context
                              .read<SignUpBloc>()
                              .add(FullNameChanged(fullName: value)),
                        ),
                        SizedBox(height: 15),
                        Text("Password"),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: !state.isPasswordVisible,
                          decoration: InputDecoration(
                            hintText: "Enter Your Password",
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(state.isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () => context
                                  .read<SignUpBloc>()
                                  .add(TogglePasswordVisibility()),
                            ),
                          ),
                          validator: (value) => value!.isEmpty
                              ? 'Please enter your password'
                              : null,
                          onChanged: (value) => context
                              .read<SignUpBloc>()
                              .add(PasswordChanged(password: value)),
                        ),
                        SizedBox(height: 15),
                        Text("Email"),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              hintText: "Enter Your Email",
                              border: OutlineInputBorder()),
                          validator: (value) =>
                              value!.isEmpty ? 'Please enter your email' : null,
                          onChanged: (value) => context
                              .read<SignUpBloc>()
                              .add(EmailChanged(email: value)),
                        ),
                        SizedBox(height: 15),
                        Text("Mobile Number"),
                        TextFormField(
                          controller: _mobileNumberController,
                          decoration: InputDecoration(
                              hintText: "Enter Your Phone Number",
                              border: OutlineInputBorder()),
                          validator: (value) => value!.isEmpty
                              ? 'Please enter your phone number'
                              : null,
                          onChanged: (value) => context
                              .read<SignUpBloc>()
                              .add(MobileNumberChanged(mobileNumber: value)),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: state.status == SignUpStatus.loading
                                ? null
                                : () {
                                    if (_formKey.currentState!.validate()) {
                                      context
                                          .read<SignUpBloc>()
                                          .add(SignUpSubmitted());
                                    }
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              padding: EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: state.status == SignUpStatus.loading
                                ? CircularProgressIndicator(color: Colors.white)
                                : Text("Sign Up",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white)),
                          ),
                        ),
                        SizedBox(height: 20),
                        Center(
                            child: Text("OR",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey))),
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
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        SizedBox(height: 20),
                        if (state.fullName.isNotEmpty)
                          Text("Full Name: ${state.fullName}"),
                        if (state.email.isNotEmpty)
                          Text("Email: ${state.email}"),
                        if (state.mobileNumber.isNotEmpty)
                          Text("Mobile Number: ${state.mobileNumber}"),
                        if (state.password.isNotEmpty)
                          Text("Password: ${state.password}"),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
