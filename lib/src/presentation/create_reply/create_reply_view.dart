import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:then_he_replied/src/presentation/common/textfield.dart';

class CreateReplyView extends ConsumerWidget {
  const CreateReplyView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(children: [
        Row(children: [Text("Create a new ...Then He Replied")]),
        Expanded(child: ReplyTextField()),
      ]),
    );
  }
}
