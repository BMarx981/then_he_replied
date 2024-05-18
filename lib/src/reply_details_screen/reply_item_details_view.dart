import 'package:flutter/material.dart';
import 'package:then_he_replied/src/reply_list_screen/reply_item.dart';

/// Displays detailed information about a SampleItem.
class ReplyItemDetailsView extends StatelessWidget {
  const ReplyItemDetailsView({super.key});

  static const routeName = '/reply_item';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text(args['title']),
      ),
      body: Center(
        child: Text(args['text']),
      ),
    );
  }
}
