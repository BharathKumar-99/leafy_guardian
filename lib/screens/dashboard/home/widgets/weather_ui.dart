import 'package:flutter/material.dart';
import 'package:leafy_guardian/constants/image_constants.dart';

class WetherCardUi extends StatelessWidget {
  final String? title;
  final String? city;
  final num? degree;
  const WetherCardUi({super.key, this.title, this.degree, this.city});

  @override
  Widget build(BuildContext context) {
    String? image;
    switch (title) {
      case 'sunny':
        if (DateTime.now().hour > 18) {
          image = ImageConstants.sunnynightWeather;
        } else {
          image = ImageConstants.sunnyWeather;
        }
        break;
      case 'cloudy':
        image = ImageConstants.cloudyWeather;
        break;
      case 'rainy':
        image = ImageConstants.rainnyWeather;
        break;
    }

    return SizedBox(
        height: MediaQuery.sizeOf(context).height / 4,
        width: double.infinity,
        child: image == null
            ? Container()
            : Row(
                children: [
                  Expanded(
                      child: Card(
                    elevation: 5,
                    shape: const CircleBorder(),
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(image))),
                    ),
                  )),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        city ?? "",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w900,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            degree?.toStringAsFixed(0) ?? "",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 90,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                          ),
                          Text(
                            '°C',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                    fontWeight: FontWeight.w900,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                          ),
                        ],
                      ),
                    ],
                  )),
                ],
              ));
  }
}
