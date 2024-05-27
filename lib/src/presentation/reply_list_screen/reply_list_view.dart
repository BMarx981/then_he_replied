import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:then_he_replied/src/data/reply_item.dart';
import 'package:then_he_replied/src/presentation/reply_list_screen/list_provider.dart';
import 'package:then_he_replied/src/presentation/reply_list_screen/list_tile_item_widget.dart';

class ReplyItemListView extends ConsumerWidget {
  const ReplyItemListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(listProvider.notifier);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder(
        stream: notifier.getReplies(),
        builder: (context, snapshot) {
          Widget returnItem = Container();
          if (snapshot.hasData) {
            final data = snapshot.data!.docs;
            returnItem = ListView.builder(
              restorationId: 'replyItemListView',
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                DocumentSnapshot document = data[index];
                final item =
                    ReplyItem.fromMap(document.data() as Map<String, dynamic>);
                return ListTileItemWidget(item: item);
              },
            );
          } else if (snapshot.hasError) {
            returnItem = const Text("Error finding data");
          }
          return returnItem;
        },
      ),
    );
  }
}
