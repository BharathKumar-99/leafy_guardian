import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/image_constants.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            Theme.of(context).colorScheme.secondary.withOpacity(0.4),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                    )),
              ),
              CircleAvatar(
                radius: 60,
                backgroundColor: Theme.of(context)
                    .colorScheme
                    .onPrimaryContainer
                    .withOpacity(0.1),
                child: CircleAvatar(
                  backgroundColor: Theme.of(context)
                      .colorScheme
                      .onPrimaryContainer
                      .withOpacity(0.3),
                  radius: 40,
                  child: const Icon(
                    Icons.lock,
                    size: 50,
                  ),
                ),
              ),
              Center(
                  child: Text(
                "Forgot Password",
                style: Theme.of(context).textTheme.displaySmall,
              )),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Center(
                  child: Text(
                "Enter your registered email address and we will send a reset link to your account password",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              )),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  prefixIcon: SizedBox(
                      height: 6,
                      width: 6,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset(ImageConstants.emailIcon),
                      )),
                  hintText: 'Email',
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder:
                      const OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              ElevatedButton(onPressed: () {}, child: const Text('Send Email'))
            ],
          ),
        ));
  }
}
