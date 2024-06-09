import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:then_he_replied/src/presentation/common/app_bar/app_bar.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  static const routeName = '/login';
  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    pwordController.dispose();
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text("Please login"),
              TextFormField(
                decoration: const InputDecoration(label: Text("Email")),
                controller: emailController,
              ),
              TextFormField(
                decoration: const InputDecoration(label: Text("Password")),
                controller: pwordController,
                obscureText: true,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        child: const Text("Submit"),
                        onPressed: () {
                          print(
                              "Email ${emailController.text}, Pword ${pwordController.text}");
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                  child: CupertinoButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/create_account");
                },
                child: const Text("Don't have an account? Sign up here.",
                    style: TextStyle(decoration: TextDecoration.underline)),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
