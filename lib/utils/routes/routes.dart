import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leafy_guardian/screens/AddPlant/add_plant.dart';
import 'package:leafy_guardian/screens/dashboard/calender/calender.dart';
import 'package:leafy_guardian/screens/dashboard/home/home.dart';
import 'package:leafy_guardian/screens/dashboard/person/person.dart';
import 'package:leafy_guardian/screens/details/all_plants.dart';
import 'package:leafy_guardian/screens/details/ask_gardian.dart';
import 'package:leafy_guardian/screens/details/plants_details.dart';

import '../../screens/dashboard/dashboard.dart';
import '../../screens/splashScreen/splash_screen.dart';
import 'routes_constants.dart';

RoutesConstants _routeName = RoutesConstants();
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

class AppRoutes {
  GoRouter router = GoRouter(
      initialLocation: _routeName.splashScreen,
      navigatorKey: _rootNavigatorKey,
      routes: [
        GoRoute(
            path: _routeName.splashScreen,
            builder: (context, state) {
              return const SplashScreen();
            }),
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            return DashboardScreen(childWidget: child);
          },
          routes: [
            GoRoute(
                path: _routeName.home,
                builder: (context, state) => const HomeScreen(),
                routes: [
                  GoRoute(
                    name: _routeName.plantDetails,
                    path: '${_routeName.plantDetails}/:plantId',
                    pageBuilder: (context, state) => CustomTransitionPage(
                        key: state.pageKey,
                        child: PlantsDetails(
                            id: int.parse(
                                state.pathParameters['plantId'] ?? "0")),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          // Change the opacity of the screen using a Curve based on the the animation's
                          // value
                          return FadeTransition(
                            opacity: CurveTween(curve: Curves.easeInOutCirc)
                                .animate(animation),
                            child: child,
                          );
                        }),
                  ),
                ]),
            GoRoute(
              path: _routeName.calender,
              builder: (context, state) => const CalenderScreen(),
            ),
            GoRoute(
              path: _routeName.allPlants,
              builder: (context, state) => const AllPlantsScreen(),
            ),
            GoRoute(
              path: _routeName.profile,
              builder: (context, state) => const ProfileScreen(),
            ),
            GoRoute(
              path: _routeName.askGaurduian,
              builder: (context, state) => AskGuardianScreen(
                plantName: state.extra as String,
              ),
            ),
          ],
        ),
        GoRoute(
          path: _routeName.addPlants,
          builder: (context, state) => const AddPlants(),
        ),
      ]);
}
