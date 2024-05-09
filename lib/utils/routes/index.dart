import 'package:flutter/material.dart';

import 'routes.dart';
import 'routes_constants.dart';

RoutesConstants routeName = RoutesConstants();
AppRoutes appRoutes = AppRoutes();

BuildContext? get ctx =>
    appRoutes.router.routerDelegate.navigatorKey.currentContext;
