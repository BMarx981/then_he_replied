import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:then_he_replied/src/presentation/common/app_bar/app_bar.dart';
import 'package:then_he_replied/src/services/firestore_auth_service.dart';

class CreateAccount extends ConsumerStatefulWidget {
  const CreateAccount({super.key});

  static const routeName = '/create_account';
  @override
  ConsumerState<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends ConsumerState<CreateAccount> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _pwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formkey = GlobalKey<FormState>();

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: RepliedAppBar(),
      ),
      body: Form(
        key: formkey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text("Create Account"),
                TextFormField(
                  decoration:
                      const InputDecoration(label: Text("Register Your Email")),
                  controller: _emailController,
                ),
                TextFormField(
                  decoration: const InputDecoration(label: Text("Password")),
                  controller: _pwordController,
                  obscureText: true,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          child: const Text("Create Account"),
                          onPressed: () async {
                            print(
                                "Email ${_emailController.text}, Password entered ${_pwordController.text}");
                            final message = await AuthService().registration(
                              email: _emailController.text,
                              password: _pwordController.text,
                            );
                            if (message!.contains('Success') &&
                                context.mounted) {
                              Navigator.of(context).pushNamed("/login");
                            }
                            if (context.mounted) {
                              Navigator.pushReplacementNamed(context, '/');
                            }
                            print(message);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
