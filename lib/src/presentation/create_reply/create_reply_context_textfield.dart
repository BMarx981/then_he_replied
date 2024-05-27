import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReplyContextTextField extends ConsumerStatefulWidget {
  const ReplyContextTextField({super.key});

  @override
  ConsumerState<ReplyContextTextField> createState() =>
      _ReplyContextFieldState();
}

class _ReplyContextFieldState extends ConsumerState<ReplyContextTextField> {
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
          maxLines: 18,
          minLines: 2,
          onChanged: (value) {
            ref.read(contextProvider.notifier).state = value;
          },
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'Please provide context for the reply.',
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

final contextProvider = StateProvider<String>((ref) {
  return "";
});
