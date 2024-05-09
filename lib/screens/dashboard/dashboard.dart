import 'package:flutter/material.dart';
import 'package:leafy_guardian/provider/dashboard_provider.dart';
import 'package:provider/provider.dart';

import '../../constants/dashboard_constants.dart';

class DashboardScreen extends StatefulWidget {
  final Widget childWidget;
  const DashboardScreen({super.key, required this.childWidget});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context, data, widgets) {
      return Scaffold(
        body: widget.childWidget,
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: data.selectedIndex,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            onTap: (value) => data.changeIndex(value, context),
            items: DashboardArray()
                .bottomNavigationList
                .map(
                  (e) => BottomNavigationBarItem(
                    icon: Image.asset(
                      e['icon'] as String,
                      height: 30,
                      width: 30,
                    ),
                    activeIcon: Container(
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    label: e['title'] as String,
                  ),
                )
                .toList()),
      );
    });
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height * 0.25); // Start at the top left
    path.quadraticBezierTo(size.width / 2, -size.height * 0.1, size.width,
        size.height * 0.25); // Curve to the top right
    path.lineTo(size.width, size.height); // Bottom right corner
    path.lineTo(0, size.height); // Bottom left corner
    path.close(); // Close the path
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
