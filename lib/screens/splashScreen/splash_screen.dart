import 'package:flutter/material.dart';
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
  AssetImage assetImageSplash = const AssetImage(ImageConstants.splashScreen);
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
  void didChangeDependencies() {
    //precaching images to make splash screen faster
    precacheImage(assetImageSplash, context);
    precacheImage(assetImageLogo, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(fit: BoxFit.fill, image: assetImageSplash),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Hero(
                tag: "logo",
                child: Image(
                  image: assetImageLogo,
                )),
          )
        ],
      ),
    );
  }
}
