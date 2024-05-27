import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:then_he_replied/src/presentation/create_reply/create_reply_context_textfield.dart';
import 'package:then_he_replied/src/presentation/create_reply/create_textfield.dart';
import 'package:then_he_replied/src/presentation/create_reply/create_title_textfield.dart';

class CreateReplyView extends ConsumerWidget {
  const CreateReplyView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(children: [
        Padding(
          padding: EdgeInsets.all(4.0),
          child: Row(children: [Text("Create a new ...Then He Replied")]),
        ),
        Padding(
          padding: EdgeInsets.all(4.0),
          child: Row(
            children: [
              Expanded(child: ReplyTitleTextField()),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(4.0),
          child: Row(
            children: [
              Expanded(
                child: ReplyContextTextField(),
              )
            ],
          ),
        ),
        Expanded(child: ReplyTextField()),
      ]),
    );
  }
}
