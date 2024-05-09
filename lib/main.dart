import 'package:flutter/material.dart';
import 'package:leafy_guardian/screens/utils/app_initilize.dart';

void main() {
  //need this so that the flutter framework is fully initialized
  WidgetsFlutterBinding.ensureInitialized();
  //calling this so that the supabase and other providers is initialized
  AppInitialize().init();
}
