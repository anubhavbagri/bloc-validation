import 'package:bloc_validation/screens/sign_in/bloc/sign_in_bloc.dart';
import 'package:bloc_validation/screens/sign_in/bloc/sign_in_event.dart';
import 'package:bloc_validation/screens/sign_in/bloc/sign_in_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
            children: [
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is SignInErrorState) {
                    return Text(
                      state.errorMessage,
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              vSizedBox,
              TextField(
                controller: emailController,
                onChanged: (val) {
                  BlocProvider.of<SignInBloc>(context).add(
                    SignInTextChangedEvent(
                        emailController.text, passwordController.text),
                  );
                },
                decoration: const InputDecoration(
                  hintText: "Email Address",
                ),
              ),
              vSizedBox,
              TextField(
                controller: passwordController,
                onChanged: (val) {
                  BlocProvider.of<SignInBloc>(context).add(
                    SignInTextChangedEvent(
                        emailController.text, passwordController.text),
                  );
                },
                decoration: const InputDecoration(
                  hintText: "Password",
                ),
                obscureText: true,
                // obscuringCharacter: '*',
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is SignInLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return CupertinoButton(
                    onPressed: () {
                      if (state is SignInValidState) {
                        BlocProvider.of<SignInBloc>(context).add(
                          SignInSubmittedEvent(
                              emailController.text, passwordController.text),
                        );
                      }
                    },
                    color:
                        (state is SignInValidState) ? Colors.blue : Colors.grey,
                    child: const Text('Sign In'),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

const vSizedBox = SizedBox(
  height: 10,
);
