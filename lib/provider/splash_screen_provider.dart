import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/routes/routes_constants.dart';

class SplashScreenProvider extends ChangeNotifier {
  //to proceed to home screen or auth screen after 2 seconds
  proceedToHome(BuildContext context) => Future.delayed(
      const Duration(seconds: 2), () => context.go(RoutesConstants().home));
}
