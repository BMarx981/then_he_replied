import 'package:flutter/material.dart';

class ReplyTextField extends StatefulWidget {
  const ReplyTextField({super.key});

  @override
  State<ReplyTextField> createState() => _ReplyTextFieldState();
}

class _ReplyTextFieldState extends State<ReplyTextField> {
  @override
  Widget build(BuildContext context) {
    return const TextField(
      maxLines: 8,
      minLines: 4,
      decoration: InputDecoration(
          border: OutlineInputBorder(
        borderRadius: BorderRadius.horizontal(
            left: Radius.circular(25), right: Radius.circular(35)),
      )),
    );
  }
}
