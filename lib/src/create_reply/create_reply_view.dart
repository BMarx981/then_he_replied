import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateReplyView extends ConsumerWidget {
  const CreateReplyView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(children: [
      Row(children: [Text("Create a new ...Then He Replied")]),
      Expanded(child: TextField()),
    ]);
  }
}
