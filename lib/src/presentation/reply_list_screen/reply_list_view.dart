import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:then_he_replied/src/presentation/reply_details_screen/reply_item_details_view.dart';
import 'package:then_he_replied/src/presentation/reply_list_screen/list_provider.dart';

class ReplyItemListView extends ConsumerWidget {
  const ReplyItemListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(listProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        restorationId: 'replyItemListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return ListTile(
              title: Text(
                  '${item.title} ${DateFormat('MM/dd/yyyy').format(item.date)}'),
              subtitle: Text('by: ${item.author}'),
              leading: const CircleAvatar(
                child: Icon(Icons.person),
              ),
              onTap: () {
                Navigator.restorablePushNamed(
                  context,
                  ReplyItemDetailsView.routeName,
                  arguments: item.toMap(),
                );
              });
        },
      ),
    );
  }
}
