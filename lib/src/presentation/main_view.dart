import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:then_he_replied/src/presentation/common/app_bar/app_bar.dart';
import 'package:then_he_replied/src/presentation/create_reply/create_reply_view.dart';
import 'package:then_he_replied/src/presentation/profile/profile_view.dart';
import 'package:then_he_replied/src/presentation/reply_list_screen/reply_list_view.dart';

/// Displays a list of ReplyItems.
class MainView extends ConsumerWidget {
  MainView({
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
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: RepliedAppBar(),
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
