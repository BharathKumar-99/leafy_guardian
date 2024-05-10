import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:leafy_guardian/api/plants_api.dart';
import 'package:leafy_guardian/model/plant_recognition_model.dart';
import 'package:leafy_guardian/screens/AddPlant/plant_detection_ui.dart';

class PlantProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController soilController = TextEditingController();
  int potNumber = 1;
  final ImagePicker picker = ImagePicker();
  File? plantImage;
  bool isCameraLoading = false;
  BuildContext? sheetContext;
  bool isLoading = false;

  addPlant(BuildContext context) async {
    double ph = 0.0;
    if (plantImage == null) {
      return;
    }
    try {
      ph = double.parse(soilController.text.trim());
    } catch (e) {
      return;
    }
    //PlantsApi().addPlant(plantImage);
    isLoading = true;
    notifyListeners();
    await PlantsApi()
        .uploadPlant(plantImage, nameController.text.trim(), potNumber, ph)
        .then((value) {
      context.pop();
    });
  }

  selectImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      plantImage = File(image.path);
    }
    notifyListeners();
  }

  void getNameOfPlant(BuildContext context) async {
    sheetContext = context;
    showModalBottomSheet(
        context: context,
        builder: (context) => DetectionUi(
              provider: this,
            ));
  }

  void detectPlant(
    File image,
  ) async {
    isCameraLoading = true;
    notifyListeners();
    nameController.clear();
    PlantRecognitionModel? value = await PlantsApi().identifyPlant(image);
    if (value != null) {
      isCameraLoading = false;
      nameController.text = value.bestMatch ?? "";
    }
    notifyListeners();
    Navigator.pop(sheetContext!);
  }
}
