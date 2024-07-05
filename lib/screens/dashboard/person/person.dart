import 'package:flutter/material.dart';
import 'package:leafy_guardian/constants/image_constants.dart';
import 'package:leafy_guardian/provider/home_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, data, widget) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image: NetworkImage(data.userModel?.pic ?? ""),
                            fit: BoxFit.fill),
                      ),
                    )),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Text(
                          " ${data.userModel?.name}",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.w900),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                            clipBehavior: Clip.antiAlias,
                            height: MediaQuery.of(context).size.height * 0.17,
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                borderRadius: BorderRadius.circular(20)),
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: -60,
                                  right: -60,
                                  child: CircleAvatar(
                                    radius: 90,
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .onPrimary
                                        .withOpacity(0.3),
                                    child: CircleAvatar(
                                      radius: 70,
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .onPrimary
                                          .withOpacity(0.4),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  right: 10,
                                  child: SizedBox(
                                      height: 110,
                                      child: Image.asset(
                                        ImageConstants.plant,
                                        opacity:
                                            const AlwaysStoppedAnimation(.5),
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10.0, left: 50),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${data.garden.length} Plants",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineMedium!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w800),
                                            ),
                                          ],
                                        ),
                                      ))
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ],
                    )),
              ],
            ),
          ),
        ),
      );
    });
  }
}
