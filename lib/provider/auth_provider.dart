import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leafy_guardian/utils/routes/index.dart';
import 'package:leafy_guardian/utils/supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../utils/routes/routes_constants.dart';

class AuthProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController signupemailController = TextEditingController();
  TextEditingController loginpasswordController = TextEditingController();
  TextEditingController signuppasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController signupName = TextEditingController();

  bool loginPasswordObscure = true;
  bool signupPasswordObscure = true;
  bool signupConfirmPasswordObscure = true;

  //executed when login button is clicked
  moveToLogin(
    BuildContext context,
  ) {
    context.push(RoutesConstants().loginScreen);
  }

  //executed when register button is clicked
  moveToRegister(
    BuildContext context,
  ) {
    context.push(RoutesConstants().signupScreen);
  }

  //executed when forgot password button is clicked
  moveToForgotPassword(
    BuildContext context,
  ) {
    context.push(RoutesConstants().forgotPassword);
  }

  //executed when password icon button is clicked in login
  void toggleLoginPasswordObscure() {
    loginPasswordObscure = !loginPasswordObscure;
    notifyListeners();
  }

  //executed when password icon button is clicked in signup
  void toggleSignupPasswordObscure() {
    signupPasswordObscure = !signupPasswordObscure;
    notifyListeners();
  }

  //executed when password icon button is clicked in signup
  void toggleSignupConfirmPasswordObscure() {
    signupConfirmPasswordObscure = !signupConfirmPasswordObscure;
    notifyListeners();
  }

  //executed when login button is clicked in login
  void login(BuildContext context) {
    context.go(routeName.home);
  }

  //executed when register button is clicked in signup
  void signup(BuildContext context) async {
    if (signupemailController.text.isEmpty ||
        !isValidEmail(signupemailController.text.toString().trim())) {
      final snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Error',
          message: 'Please enter a valid email address',
          contentType: ContentType.failure,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
      return;
    } else if (signuppasswordController.text.toString().trim() !=
            confirmPasswordController.text.toString().trim() ||
        !isPasswordValid(signuppasswordController.text.toString().trim())) {
      final snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Error',
          message: 'Please enter a valid password',
          contentType: ContentType.failure,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
      return;
    } else if (signupName.text.isEmpty) {
      final snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Error',
          message: 'Please enter a valid Username',
          contentType: ContentType.failure,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
      return;
    } else {
      final AuthResponse res = await SupaFlow.client.auth.signUp(
        email: signupemailController.text.toString().trim(),
        password: signuppasswordController.text.toString().trim(),
      );

      await SupaFlow.client.from('user').insert({
        'email': signupemailController.text.toString().trim(),
        'userId': res.user?.id,
        'name': signupName.text.toString().trim()
      });
    }
  }

  //to check if email is valid
  bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  //to check if password is valid
  bool isPasswordValid(String password) {
    const int minLength = 6;
    final RegExp specialChars = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    final RegExp lowercaseChars = RegExp(r'[a-z]');
    final RegExp digits = RegExp(r'[0-9]');
    return password.length >= minLength &&
        specialChars.hasMatch(password) &&
        lowercaseChars.hasMatch(password) &&
        digits.hasMatch(password);
  }
}
