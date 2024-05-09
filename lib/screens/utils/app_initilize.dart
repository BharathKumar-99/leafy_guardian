import 'package:flutter/material.dart';
import 'package:leafy_guardian/screens/utils/app_provider.dart';
import 'package:leafy_guardian/utils/supabase/supabase.dart';

class AppInitialize {
  init() async {
    //initialize supabase
    await SupaFlow.initialize();
    //initialize providers
    runApp(AppProviders.build());
  }
}
