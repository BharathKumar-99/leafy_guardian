import 'package:dio/dio.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:leafy_guardian/constants/constants.dart';
import 'package:leafy_guardian/model/garden_model.dart';
import 'package:leafy_guardian/model/user_model.dart';
import 'package:leafy_guardian/model/weather_model.dart';
import 'package:leafy_guardian/utils/supabase/supabase.dart';
import 'package:location/location.dart'; 
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

  getWeather() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    print(locationData);
    Dio dio = Dio();
    String apiKey = Constansts().weatherApi;
    String url =
        'https://api.openweathermap.org/data/3.0/onecall?lat=${locationData.latitude}&lon=${locationData.longitude}&appid=$apiKey&units=metric';

    WeatherModel weatherModel = WeatherModel();

    try {
      await dio
          .get(
        url,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'multipart/form-data',
          },
        ),
      )
          .then((value) {
        weatherModel = WeatherModel.fromJson(value.data);
      });
      return weatherModel;
    } catch (error) {
      print('Error: $error');
    }
  }

  fetchWetherData(
    String weatherData,
  ) async {
    final model =
        GenerativeModel(model: 'gemini-pro', apiKey: Constansts().googleaPIkEY);

    String prompt =
        'based on following data in $weatherData tell me if its sunny , cloudy ,rainy weather  return a single word only';
    final content = [Content.text(prompt)];
    try {
      return await model.generateContent(content).then((value) => value.text);
    } catch (e) {
      return "error";
    }
  }
}
