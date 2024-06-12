// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/routes/index.dart';
import '../../utils/theme/color_schemes.g.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();

  static _AppState of(BuildContext context) =>
      context.findAncestorStateOfType<_AppState>()!;
}

class _AppState extends State<App> {
  Locale? _locale;
  ThemeMode _themeMode = ThemeMode.system;

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
      });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'leafy_guardian',
      locale: _locale,
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          elevatedButtonTheme: elevatedButtonTheme),
      darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme,
          elevatedButtonTheme: elevatedButtonTheme),
      themeMode: _themeMode,
      routerDelegate: appRoutes.router.routerDelegate,
      routeInformationProvider: appRoutes.router.routeInformationProvider,
      routeInformationParser: appRoutes.router.routeInformationParser,
    );
  }
}
