import 'package:leafy_guardian/provider/home_provider.dart';
import 'package:provider/provider.dart';
import '../../provider/app_config.dart';
import '../../provider/auth_provider.dart';
import '../../provider/dashboard_provider.dart';
import '../../provider/splash_screen_provider.dart';
import 'app.dart';

class AppProviders {
  static MultiProvider build() {
    return MultiProvider(
      providers: [
        //for application config provider
        ChangeNotifierProvider(create: (_) => AppConfig()),
        //for splash screen
        ChangeNotifierProvider(create: (_) => SplashScreenProvider()),
        //for authentication
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        //for dashboard
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
        //for home
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        //for plants
      ],
      //running the app
      child: const App(),
    );
  }
}
