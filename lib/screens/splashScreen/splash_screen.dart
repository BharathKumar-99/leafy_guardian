import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:leafy_guardian/constants/image_constants.dart';
import 'package:provider/provider.dart';

import '../../provider/splash_screen_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SplashScreenProvider splashScreenProvider;
  AssetImage assetImageBG = const AssetImage(ImageConstants.splashFarmer);
  AssetImage assetImageLogo = const AssetImage(ImageConstants.logoWhite);

  @override
  void initState() {
    splashScreenProvider =
        Provider.of<SplashScreenProvider>(context, listen: false);
    //to proceed to home screen
    splashScreenProvider.proceedToHome(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image(image: assetImageLogo),
            ),
          ).animate().slideY(begin: 0.0, end: 1.0, duration: 1500.ms),
          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image(image: assetImageBG),
          ).animate().slideY(begin: 1.0, end: 0.0, duration: 1500.ms),
        ],
      ),
    );
  }
}
