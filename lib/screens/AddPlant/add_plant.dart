import 'package:flutter/material.dart';
import 'package:leafy_guardian/constants/image_constants.dart';
import 'package:leafy_guardian/provider/plant_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

class AddPlants extends StatefulWidget {
  const AddPlants({super.key});

  @override
  State<AddPlants> createState() => _AddPlantsState();
}

class _AddPlantsState extends State<AddPlants> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PlantProvider(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Add Plant"),
        ),
        body: Consumer<PlantProvider>(builder: (context, data, widget) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SingleChildScrollView(
              child: data.isLoading
                  ? 
                   Center(child: Lottie.asset(ImageConstants.addPlantLoading))
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          'Name of plant',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: data.nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText:
                                "Click on the icon to Auto Detect the plant ->",
                            suffixIcon: IconButton(
                              onPressed: () {
                                data.getNameOfPlant(context);
                              },
                              icon: const Icon(Icons.crop_free_outlined),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Please Select Pot of the plant',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 20),
                        NumberPicker(
                          value: data.potNumber,
                          axis: Axis.horizontal,
                          minValue: 1,
                          maxValue: 5,
                          onChanged: (value) =>
                              setState(() => data.potNumber = value),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Please Enter Soil Ph',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: data.soilController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText:
                                "Please Enter The Soil Ph displayed on the meter",
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Select image  of plant',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () => data.selectImage(),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                              ),
                              child: data.plantImage == null
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 30),
                                      child: Image.asset(
                                        ImageConstants.addPlant,
                                        color: Colors.grey.shade400,
                                      ),
                                    )
                                  : Image.file(
                                      data.plantImage!,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {
                                  data.addPlant(context);
                                },
                                child: const Text("Add Plant")))
                      ],
                    ),
            ),
          );
        }),
      ),
    );
  }
}
