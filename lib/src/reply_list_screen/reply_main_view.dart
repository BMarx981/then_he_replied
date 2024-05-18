import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:then_he_replied/src/create_reply/create_reply_view.dart';
import 'package:then_he_replied/src/profile/profile_view.dart';
import 'package:then_he_replied/src/reply_list_screen/reply_list_view.dart';

import 'package:then_he_replied/src/settings/settings_view.dart';

/// Displays a list of ReplyItems.
class ReplyItemMainView extends ConsumerWidget {
  ReplyItemMainView({
    super.key,
  });

  static const routeName = '/';
  final List<Widget> bodies = [
    const ReplyItemListView(),
    const CreateReplyView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indexBottomNavbar = ref.watch(indexBottomNavbarProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('...Then He Replied'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: bodies[indexBottomNavbar],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexBottomNavbar,
          onTap: (value) => ref
              .read(indexBottomNavbarProvider.notifier)
              .update((state) => value),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline_outlined),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ]),
    );
  }
}

final indexBottomNavbarProvider = StateProvider<int>((ref) {
  return 0;
});
