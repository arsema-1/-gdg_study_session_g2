import 'package:flutter/material.dart';

class TextFieldW extends StatelessWidget {
  final String hintText;
  final bool obs;
  final bool suffix;
  const TextFieldW(
      {super.key,
      required this.hintText,
      this.obs = false,
      this.suffix = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 246, 242, 242),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)),
      child: TextField(
        decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffix ? Icon(Icons.remove_red_eye) : null),
        obscureText: obs,
      ),
    );
  }
}
