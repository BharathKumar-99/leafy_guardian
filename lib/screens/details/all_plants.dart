import 'package:flutter/material.dart';
import 'package:leafy_guardian/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../dashboard/home/widgets/common_ui_components.dart';
import '../dashboard/home/widgets/garden_list_ui.dart';

class AllPlantsScreen extends StatefulWidget {
  const AllPlantsScreen({super.key});

  @override
  State<AllPlantsScreen> createState() => _AllPlantsScreenState();
}

class _AllPlantsScreenState extends State<AllPlantsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, data, widget) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('All Plants'),
          centerTitle: true,
          actions: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: addPlants())
          ],
        ),
        body: ListView.builder(
            itemCount: data.garden.length,
            itemBuilder: (context, index) {
              var gardenModel = data.garden[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: gardenListUi(
                    gardenModel.image ?? "",
                    gardenModel.name ?? "",
                    gardenModel.temp ?? 0.0,
                    gardenModel.soil ?? "",
                    gardenModel.humidity ?? 0,
                    gardenModel.id.toString(),
                    gardenModel.description?.description ?? ""),
              );
            }),
      );
    });
  }
}
