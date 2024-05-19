import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReplyTitleTextField extends ConsumerStatefulWidget {
  const ReplyTitleTextField({super.key});

  @override
  ConsumerState<ReplyTitleTextField> createState() => _ReplyTextFieldState();
}

class _ReplyTextFieldState extends ConsumerState<ReplyTitleTextField> {
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
        TextField(
          onChanged: (value) {
            ref.read(titleProvider.notifier).state = value;
          },
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'Title',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(25),
                right: Radius.circular(35),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

final titleProvider = StateProvider<String>((ref) {
  return "";
});
