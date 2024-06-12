import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leafy_guardian/utils/routes/routes_constants.dart';

import '../../../../constants/image_constants.dart';

gardenListUi(String image, String name, num temp, String soilPh, num humidity,
        String id, String description) =>
    Builder(builder: (context) {
      return GestureDetector(
        onTap: () {
          context.pushNamed(RoutesConstants().plantDetails,
              pathParameters: {'plantId': id});
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(20),
            image:
                DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                name,
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              description,
                              maxLines: 5,
                              overflow: TextOverflow.fade,
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ),
                        ],
                      )),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Chip(
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.2),
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(20)),
                          label: Text(
                            temp.toString(),
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          avatar: Image.asset(ImageConstants.temp),
                        ),
                        Chip(
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.2),
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(20)),
                          label: Text(
                            humidity.toString(),
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          avatar: Image.asset(ImageConstants.humidity),
                        ),
                        Chip(
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.2),
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(20)),
                          label: Text(
                            soilPh.toString(),
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          avatar: Image.asset(ImageConstants.soil),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
