import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:then_he_replied/src/presentation/common/app_bar/app_bar.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  static const routeName = '/login';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, kToolbarHeight),
          child: RepliedAppBar(),
        ),
        body: Center(
            child: Column(
          children: [
            Text("Welcome to ...Then He Replied."),
            Text("Please login")
          ],
        )));
  }
}
