import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leafy_guardian/constants/image_constants.dart';
import 'package:leafy_guardian/utils/routes/routes_constants.dart';

gardenUi(String image, String name, num temp, String soilPh, num humidity,
        String id) =>
    Builder(builder: (context) {
      return SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            context.goNamed(RoutesConstants().plantDetails,
                pathParameters: {'plantId': id});
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                clipBehavior: Clip.none,
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.44,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade200, width: 2),
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(image), fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
              ),
              Text(
                name,
                style: Theme.of(context).textTheme.labelLarge,
              )
            ],
          ),
        ),
      );
    });
