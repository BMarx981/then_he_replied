import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:then_he_replied/src/presentation/common/app_bar/app_bar.dart';

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
          child: Column(
            children: [
              const Text("Welcome to ...Then He Replied."),
              const Text("Create Account"),
              TextFormField(
                decoration: const InputDecoration(label: Text("Email")),
                controller: _emailController,
              ),
              TextFormField(
                decoration: const InputDecoration(label: Text("Password")),
                controller: _pwordController,
                obscureText: true,
              ),
              ElevatedButton(
                child: const Text("Submit"),
                onPressed: () {
                  print(
                      "Email ${_emailController.text}, Pword ${_pwordController.text}");
                  Navigator.pushReplacementNamed(context, '/');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
