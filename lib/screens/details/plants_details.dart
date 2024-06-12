import 'package:flutter/material.dart';
import 'package:leafy_guardian/api/home_api.dart';
import 'package:leafy_guardian/api/plants_api.dart';
import 'package:leafy_guardian/model/garden_model.dart';
import 'package:lottie/lottie.dart';
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
  bool error = false;
  bool watering = false;

  @override
  void initState() {
    getPlants();
    super.initState();
  }

  getPlants() async {
    gardenModel = await HomeApi().getIndividualGarden(widget.id);
    gardenModel?.description ??
        await _plantsApi
            .fetchData(gardenModel?.name ?? "", widget.id)
            .then((value) async {
          if (value == 'error') {
            error = true;
          }
          gardenModel = await HomeApi().getIndividualGarden(widget.id);
        });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: error
          ? Center(child: Lottie.asset(ImageConstants.error))
          : gardenModel == null
              ? Center(
                  child: Lottie.asset(ImageConstants.loading),
                )
              : SingleChildScrollView(
                  child: Stack(
                    children: [
                      Column(
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
                                      fit: BoxFit.fill,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              2,
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
                                    height: MediaQuery.of(context).size.height /
                                        2.5,
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
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
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
                                            gardenModel?.description
                                                    ?.description ??
                                                "",
                                            maxLines: 4,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            "Recomended",
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                  fontWeight: FontWeight.w900,
                                                ),
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Chip(
                                                  backgroundColor:
                                                      Theme.of(context)
                                                          .colorScheme
                                                          .primary
                                                          .withOpacity(0.2),
                                                  shape: RoundedRectangleBorder(
                                                      side: const BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  label: Text(
                                                    gardenModel?.description
                                                            ?.idealTemp
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
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .colorScheme
                                                        .primary
                                                        .withOpacity(0.2),
                                                shape: RoundedRectangleBorder(
                                                    side: const BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                label: Text(
                                                  gardenModel?.description
                                                          ?.idelMoist
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
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .colorScheme
                                                        .primary
                                                        .withOpacity(0.2),
                                                shape: RoundedRectangleBorder(
                                                    side: const BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                label: Text(
                                                  gardenModel?.description
                                                          ?.recomendedSoilPh
                                                          .toString() ??
                                                      "",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelSmall,
                                                ),
                                                avatar: Image.asset(
                                                    ImageConstants.soil),
                                              ))
                                            ],
                                          )
                                        ]),
                                  ),
                                ),
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
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                            ),
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: gardenModel
                                      ?.description?.commonQuestions?.length ??
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
                      if (watering)
                        Container(
                            color: const Color.fromARGB(64, 58, 58, 58),
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            child: Lottie.asset(ImageConstants.afterwaterPlant))
                    ],
                  ),
                ),
      floatingActionButton: SizedBox(
        height: 80,
        child: ElevatedButton(
          onPressed: () async {
            setState(() {
              watering = true;
            });
            await PlantsApi().updateWaterValue();
            Future.delayed(const Duration(seconds: 7), () {
              setState(() {
                watering = false;
              });
            });
          },
          child: Text(watering ? 'Watering' : 'Water Plant'),
        ),
      ),
    );
  }
}
