import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sign In with Email"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 20,
          ),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              Text(
                "Error will show up here",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField()
            ],
          ),
        ),
      ),
    );
  }
}
