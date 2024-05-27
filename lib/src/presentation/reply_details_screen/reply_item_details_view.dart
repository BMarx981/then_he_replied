import 'package:flutter/material.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(args['context']),
            Center(
              child: Text(args['text']),
            ),
          ],
        ),
      ),
    );
  }
}
