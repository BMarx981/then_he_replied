import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:then_he_replied/src/reply_details_screen/reply_item_details_view.dart';
import 'package:then_he_replied/src/reply_list_screen/reply_list_provider.dart';

class ReplyItemListView extends ConsumerWidget {
  const ReplyItemListView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(replyListProviderProvider);
    return provider.when(
      data: (items) {
        return ListView.builder(
          restorationId: 'replyItemListView',
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            final item = items[index];

            return ListTile(
                title: Text(
                    '${item.title} ${DateFormat('MM/dd/yyyy').format(item.date)}'),
                subtitle: Text('by: ${item.author}'),
                leading: const CircleAvatar(
                  // Display the Flutter Logo image asset.
                  foregroundImage: AssetImage('assets/images/flutter_logo.png'),
                ),
                onTap: () {
                  // Navigate to the details page. If the user leaves and returns to
                  // the app after it has been killed while running in the
                  // background, the navigation stack is restored.
                  Navigator.restorablePushNamed(
                    context,
                    ReplyItemDetailsView.routeName,
                    arguments: item.toMap(),
                  );
                });
          },
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      error: (error, stackTrace) => Text(stackTrace.toString()),
    );
  }
}
