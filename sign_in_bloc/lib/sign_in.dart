import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'sign_up_screen.dart';
import 'sleep_tracker_screen.dart';
import 'bloc/sign_in_bloc.dart'; // Import your BLoC

class SignInScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Welcome", style: TextStyle(color: Colors.blue)),
          centerTitle: true,
        ),
        body: BlocConsumer<SignInBloc, SignInState>(
          listener: (context, state) {
            if (state.status == SignInStatus.success) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SleepTrackerScreen()),
              );
            } else if (state.status == SignInStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage)),
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Sign In",
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      Text("Enter your credentials to continue"),
                      SizedBox(height: 20),
                      Text("Email"),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            hintText: "Enter Email",
                            border: OutlineInputBorder()),
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter your email' : null,
                        onChanged: (value) => context
                            .read<SignInBloc>()
                            .add(EmailChanged(email: value)),
                      ),
                      SizedBox(height: 15),
                      Text("Password"),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: !state.isPasswordVisible,
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(state.isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () => context
                                .read<SignInBloc>()
                                .add(TogglePasswordVisibility()),
                          ),
                        ),
                        validator: (value) => value!.isEmpty
                            ? 'Please enter your password'
                            : null,
                        onChanged: (value) => context
                            .read<SignInBloc>()
                            .add(PasswordChanged(password: value)),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text("Forgot Password?",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: state.status == SignInStatus.loading
    ? null
    : () {
        if (_formKey.currentState!.validate()) {
          context.read<SignInBloc>().add(SignInSubmitted());

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SleepTrackerScreen()),
          );
        }
      },

                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: state.status == SignInStatus.loading
                              ? CircularProgressIndicator(color: Colors.white)
                              : Text("Sign In",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white)),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text("OR",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                          textAlign: TextAlign.center),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()),
                              );
                            },
                            child: Text("Sign Up",
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      if (state.email.isNotEmpty)
                        Text("Entered Email: ${state.email}"),
                       if (state.password.isNotEmpty)
                         Text("Entered Password: ${state.password}"),
                    ],
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