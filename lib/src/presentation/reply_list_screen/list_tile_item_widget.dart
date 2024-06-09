import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:then_he_replied/src/data/reply_item.dart';
import 'package:then_he_replied/src/presentation/reply_details_screen/reply_item_details_view.dart';
import 'package:then_he_replied/src/presentation/reply_list_screen/list_provider.dart';

class ListTileItemWidget extends ConsumerWidget {
  const ListTileItemWidget({
    super.key,
    required this.item,
  });

  final ReplyItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      onDismissed: (direction) {
        ref.read(listProvider.notifier).removeItem(item.id);
      },
      key: UniqueKey(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.white
                : Colors.black,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.grey, width: .5),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black.withAlpha(100)
                    : Colors.white.withAlpha(100),
                blurRadius: 3,
                offset: const Offset(3, 3),
              )
            ],
          ),
          child: ListTile(
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
              }),
        ),
      ),
    );
  }
}
