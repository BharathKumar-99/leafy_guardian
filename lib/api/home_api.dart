import 'package:leafy_guardian/constants/constants.dart';
import 'package:leafy_guardian/model/garden_model.dart';
import 'package:leafy_guardian/model/user_model.dart';
import 'package:leafy_guardian/utils/supabase/supabase.dart';

import '../model/didyouknow_model.dart';

class HomeApi {
  getHomeData() async {
    var data = await SupaFlow.client
        .from('user')
        .select('*')
        .eq('user_id', Constansts().userId);
    return UserModel.fromJson(data.first);
  }

  getdidyouknow() async {
    var data = await SupaFlow.client.from('didyouknow').select('*');
    List<DidYouKnowModel> list = [];
    for (var item in data) {
      list.add(DidYouKnowModel.fromJson(item));
    }
    return list;
  }

  getPlants() async {
    List<GardenModel> list = [];
    SupaFlow.client
        .from('plants')
        .stream(primaryKey: ['id']).listen((List<Map<String, dynamic>> data) {
      for (var item in data) {
        list.add(GardenModel.fromJson(item));
      }
    });
    return list;
  }

  getIndividualGarden(int id) async {
    var data = await SupaFlow.client
        .from('plants')
        .select('*')
        .eq('user_id', Constansts().userId)
        .eq('id', id);
    return GardenModel.fromJson(data.first);
  }
}
