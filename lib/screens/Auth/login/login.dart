import 'package:flutter/material.dart';
import 'package:leafy_guardian/constants/image_constants.dart';
import 'package:leafy_guardian/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                        'Enter your details to login',
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
                  'Email',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: data.emailController,
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
                  controller: data.loginpasswordController,
                  obscureText: data.loginPasswordObscure,
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
                          data.toggleLoginPasswordObscure();
                        },
                        icon: Icon(data.loginPasswordObscure
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
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      data.moveToForgotPassword(context);
                    },
                    child: Text(
                      'Forgot password?',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {data.login(context);},
                        child: Text(
                          'Login',
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
                      'Sign in with',
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
                  height: 90,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",
                        style: Theme.of(context).textTheme.titleSmall),
                    const SizedBox(
                      width: 5,
                    ),
                    TextButton(
                        onPressed: () {
                          data.moveToRegister(context);
                        },
                        child: Text("Sign Up",
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
