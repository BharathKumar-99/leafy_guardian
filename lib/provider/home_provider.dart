import 'package:flutter/material.dart';
import 'package:leafy_guardian/api/home_api.dart';
import 'package:leafy_guardian/model/didyouknow_model.dart';
import 'package:leafy_guardian/model/user_model.dart';

import '../model/garden_model.dart';
import '../utils/supabase/supabase.dart';

class HomeProvider extends ChangeNotifier {
  List<GardenModel> garden = [];
  String? profilePic;
  final HomeApi _homeApi = HomeApi();
  UserModel? userModel;
  List<DidYouKnowModel> didYouKnowModel = [];

  //to get time of day based on current time
  get timeOfday => DateTime.now().hour < 12
      ? 'Good Morning'
      : DateTime.now().hour < 17
          ? 'Good Afternoon'
          : 'Good Evening';

  //to get users garden data from supabase
  init() async {
    userModel = await _homeApi.getHomeData();
    didYouKnowModel = await _homeApi.getdidyouknow();
    SupaFlow.client
        .from('plants')
        .stream(primaryKey: ['id']).listen((List<Map<String, dynamic>> data) {
      garden.clear();
      for (var item in data) {
        garden.add(GardenModel.fromJson(item));
      }
      notifyListeners();
    });

    notifyListeners();
  }
}
