import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class ReplyItemDetailsView extends StatelessWidget {
  const ReplyItemDetailsView({super.key});

  static const routeName = '/reply_item';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: const Center(
        child: Text('More Information Here'),
      ),
    );
  }
}
