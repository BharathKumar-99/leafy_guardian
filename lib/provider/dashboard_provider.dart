import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../utils/routes/index.dart';

class DashboardProvider extends ChangeNotifier {
  var selectedIndex = 0;

  //to change index of dashboard menu
  changeIndex(int value, BuildContext context) {
    var path = routeName.home;
    switch (value) {
      case 0:
        path = routeName.home;
        break;

      case 1:
        path = routeName.profile;
        break;
    }
    selectedIndex = value;
    context.go(path);
    notifyListeners();
  }
}
