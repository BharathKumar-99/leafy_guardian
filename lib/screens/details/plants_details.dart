import 'package:flutter/material.dart';
import 'package:leafy_guardian/api/home_api.dart';
import 'package:leafy_guardian/api/plants_api.dart';
import 'package:leafy_guardian/model/garden_model.dart';

import '../../constants/image_constants.dart';

class PlantsDetails extends StatefulWidget {
  final int id;
  const PlantsDetails({super.key, required this.id});

  @override
  State<PlantsDetails> createState() => _PlantsDetailsState();
}

class _PlantsDetailsState extends State<PlantsDetails> {
  GardenModel? gardenModel;
  final PlantsApi _plantsApi = PlantsApi();

  @override
  void initState() {
    getPlants();
    super.initState();
  }

  getPlants() async {
    gardenModel = await HomeApi().getIndividualGarden(widget.id);
    gardenModel?.description ??
        await _plantsApi.fetchData(gardenModel?.name ?? "", widget.id).then(
            (value) async =>
                gardenModel = await HomeApi().getIndividualGarden(widget.id));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: gardenModel == null
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 1.4,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(70),
                              bottomRight: Radius.circular(70),
                            ),
                            child: Material(
                              elevation: 10,
                              child: Image.network(
                                gardenModel?.image ?? "",
                                fit: BoxFit.cover,
                                height: MediaQuery.of(context).size.height / 2,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.height / 2.9,
                            left: MediaQuery.of(context).size.width / 20,
                            right: MediaQuery.of(context).size.width / 20,
                            bottom: 0,
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              height: MediaQuery.of(context).size.height / 2.5,
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      gardenModel?.name ?? "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall!
                                          .copyWith(
                                              fontWeight: FontWeight.w900,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                    ),
                                    Text(
                                      gardenModel?.description?.description ??
                                          "",
                                      maxLines: 6,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Chip(
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .primary
                                                .withOpacity(0.2),
                                            shape: RoundedRectangleBorder(
                                                side: const BorderSide(
                                                    color: Colors.transparent),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            label: Text(
                                              gardenModel
                                                      ?.description?.idealTemp
                                                      .toString() ??
                                                  "",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall,
                                            ),
                                            avatar: Image.asset(
                                                ImageConstants.temp),
                                          ),
                                        ),
                                        Expanded(
                                            child: Chip(
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .primary
                                              .withOpacity(0.2),
                                          shape: RoundedRectangleBorder(
                                              side: const BorderSide(
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          label: Text(
                                            gardenModel?.description?.idelMoist
                                                    .toString() ??
                                                "",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall,
                                          ),
                                          avatar: Image.asset(
                                              ImageConstants.humidity),
                                        ))
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Chip(
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .primary
                                              .withOpacity(0.2),
                                          shape: RoundedRectangleBorder(
                                              side: const BorderSide(
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          label: Text(
                                            gardenModel?.description
                                                    ?.recomendedSoilPh
                                                    .toString() ??
                                                "",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall,
                                          ),
                                          avatar:
                                              Image.asset(ImageConstants.soil),
                                        ))
                                      ],
                                    )
                                  ]),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Common Questions',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:
                            gardenModel?.description?.commonQuestions?.length ??
                                0,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                                "Q: ${gardenModel?.description?.commonQuestions?[index].question}"),
                            subtitle: Text(
                                "A: ${gardenModel?.description?.commonQuestions?[index].answer}"),
                          );
                        })
                  ],
                ),
              ));
  }
}
