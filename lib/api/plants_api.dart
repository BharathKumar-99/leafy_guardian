import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:leafy_guardian/constants/constants.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:leafy_guardian/model/garden_model.dart';
import 'package:leafy_guardian/model/plant_details_model.dart';
import 'package:leafy_guardian/model/plant_recognition_model.dart';
import 'package:leafy_guardian/utils/supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PlantsApi {
  fetchData(String plantName, int id) async {
    final model =
        GenerativeModel(model: 'gemini-pro', apiKey: Constansts().googleaPIkEY);

    String prompt =
        'Give a details about $plantName in the following format {"name": "name","description": "description in short","common_questions": [{"question": "question","answer": " answers as String in 2 lines" }, {"question": "question","answer": " answers should not include : or any symboles" },{"question": "question","answer": " answers should not include : or any symboles" }],"ideal_temp": "ideal_temp ", "ideal_moist": "ideal_moist","recommended_soil_ph": "Acidic or Basic"}  ';
    final content = [Content.text(prompt)];
    try {
      return await model
          .generateContent(content)
          .then((value) => insertPlantDetails(value.text ?? "", id));
    } catch (e) {
      return "error";
    }
  }

  insertPlantDetails(String model, int id) async {
    PlantsDetailModel data = PlantsDetailModel.fromRawJson(model);
    try {
      await SupaFlow.client
          .from('plants')
          .update({"description": data.toJson()}).match({"id": id}).select();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  identifyPlant(File image) async {
    Dio dio = Dio();
    String url = 'https://my-api.plantnet.org/v2/identify/all';
    String apiKey = Constansts().plantsApi;
    PlantRecognitionModel plantRecognitionModel = PlantRecognitionModel();
    FormData formData = FormData.fromMap({
      'images': await MultipartFile.fromFile(
        image.path,
        filename: 'plant.jpg',
      ),
      'organs': 'auto',
    });

    try {
      await dio
          .post(
        url,
        data: formData,
        queryParameters: {
          'include-related-images': 'false',
          'no-reject': 'false',
          'lang': 'en',
          'api-key': apiKey,
        },
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'multipart/form-data',
          },
        ),
      )
          .then((value) {
        if (value.statusCode == 404) {
          plantRecognitionModel = PlantRecognitionModel(bestMatch: "Not Found");
        }
        plantRecognitionModel = PlantRecognitionModel.fromJson(value.data);
      });

      return plantRecognitionModel;
    } catch (error) {
      debugPrint('Error: $error');
    }
  }

  uploadPlant(File? plantImage, String name, int pot, double soilPh) async {
    String plantImagename = getRandomString(10);
    await SupaFlow.client.storage.from('public_bucket').upload(
          'plants/$plantImagename.png',
          plantImage!,
          fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
        );
    final String publicUrl = SupaFlow.client.storage
        .from('public-bucket')
        .getPublicUrl('plants/$plantImagename.png');
    GardenModel data =
        GardenModel(name: name, image: publicUrl, soilPh: soilPh, potNo: pot);

    insertPlant(data);
  }

  insertPlant(GardenModel data) async {
    await SupaFlow.client.from('plants').insert({
      'name': data.name,
      'image': data.image,
      'soil_ph': data.soilPh,
      'potNo': data.potNo,
      'user_id': Constansts().userId
    }).select();
  }

  String getRandomString(int length) {
    const charset =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random random = Random();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  updateWaterValue() async {
    await SupaFlow.client
        .from('plants')
        .update({'value': 1})
        .eq('id', 1004)
        .select();
  }
}
