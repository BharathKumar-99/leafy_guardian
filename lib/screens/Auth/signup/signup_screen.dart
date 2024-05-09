import 'package:flutter/material.dart';
import 'package:leafy_guardian/constants/image_constants.dart';
import 'package:provider/provider.dart';

import '../../../provider/auth_provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, data, widget) {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor:
            Theme.of(context).colorScheme.secondary.withOpacity(0.4),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 90,
                ),
                Hero(tag: 'logo', child: Image.asset(ImageConstants.logoWhite)),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Lets Get Started',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(height: 20),
                Text(
                  'Username',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: data.signupName,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor:
                        Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    prefixIcon: SizedBox(
                        height: 6,
                        width: 6,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(ImageConstants.personActive),
                        )),
                    hintText: 'Username',
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Email',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: data.signupemailController,
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
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Password',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  obscureText: data.signupPasswordObscure,
                  controller: data.signuppasswordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor:
                        Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    prefixIcon: SizedBox(
                        height: 6,
                        width: 6,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(ImageConstants.lockIcon),
                        )),
                    hintText: 'Password',
                    suffixIcon: IconButton(
                        onPressed: () {
                          data.toggleSignupPasswordObscure();
                        },
                        icon: Icon(data.signupPasswordObscure
                            ? Icons.visibility_rounded
                            : Icons.visibility_off_rounded)),
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Confirm Password',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  obscureText: data.signupConfirmPasswordObscure,
                  controller: data.confirmPasswordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor:
                        Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    prefixIcon: SizedBox(
                        height: 6,
                        width: 6,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(ImageConstants.lockIcon),
                        )),
                    hintText: 'Confirm Password',
                    suffixIcon: IconButton(
                        onPressed: () {
                          data.toggleSignupConfirmPasswordObscure();
                        },
                        icon: Icon(data.signupConfirmPasswordObscure
                            ? Icons.visibility_rounded
                            : Icons.visibility_off_rounded)),
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Signup',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ))),
                Row(
                  children: [
                    const Expanded(
                        child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(color: Colors.white),
                    )),
                    Text(
                      'Sign up with',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Expanded(
                        child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(color: Colors.white),
                    ))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset(ImageConstants.goolgeIcon))),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Already have an account?",
                        style: Theme.of(context).textTheme.titleSmall),
                    const SizedBox(
                      width: 5,
                    ),
                    TextButton(
                        onPressed: () {
                          data.moveToLogin(context);
                        },
                        child: Text("Sign In",
                            style: Theme.of(context).textTheme.titleSmall)),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
