import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReplyTextField extends ConsumerStatefulWidget {
  const ReplyTextField({super.key});

  @override
  ConsumerState<ReplyTextField> createState() => _ReplyTextFieldState();
}

class _ReplyTextFieldState extends ConsumerState<ReplyTextField> {
  final controller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextField(
          maxLines: 18,
          minLines: 4,
          decoration: InputDecoration(
              border: OutlineInputBorder(
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(25), right: Radius.circular(35)),
          )),
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {
                controller.text;
              },
            )
          ],
        )
      ],
    );
  }
}
