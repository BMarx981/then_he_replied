import 'package:flutter/material.dart';
import 'package:then_he_replied/src/settings/settings_view.dart';

class RepliedAppBar extends StatelessWidget {
  const RepliedAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }
}
