import 'package:leafy_guardian/constants/constants.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:leafy_guardian/model/plant_details_model.dart';
import 'package:leafy_guardian/utils/supabase/supabase.dart';

class PlantsApi {
  fetchData(String plantName, int id) async {
    final model =
        GenerativeModel(model: 'gemini-pro', apiKey: Constansts().googleaPIkEY);

    String prompt =
        'Give a details about $plantName in the following format {"name": "name","description": "description in short","common_questions": [{"question": "question","answer": " answers as String in 2 lines" }, {"question": "question","answer": " answers should not include : or any symboles" },{"question": "question","answer": " answers should not include : or any symboles" }],"ideal_temp": "ideal_temp ", "ideal_moist": "ideal_moist","recommended_soil_ph": "Acidic or Basic"}  ';
    final content = [Content.text(prompt)];
    return await model
        .generateContent(content)
        .then((value) => insertPlantDetails(value.text ?? "", id));
  }

  insertPlantDetails(String model, int id) async {
    PlantsDetailModel data = PlantsDetailModel.fromRawJson(model);
    try {
      var datares = await SupaFlow.client
          .from('plants')
          .update({"description": data.toJson()}).match({"id": id}).select();
      print(datares);
    } catch (e) {
      print(e);
    }
  }
}
