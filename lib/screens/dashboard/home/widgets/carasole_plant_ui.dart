import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:leafy_guardian/provider/home_provider.dart';

import 'garden_ui.dart';

getCarasoleUi(HomeProvider data) => CarouselSlider.builder(
    options: CarouselOptions(
        autoPlay: false,
        enlargeCenterPage: true,
        viewportFraction: 0.5,
        aspectRatio: 1,
        initialPage: 2,
        enlargeFactor: 0.5,
        clipBehavior: Clip.antiAlias,
        scrollPhysics: const BouncingScrollPhysics()),
    itemCount: data.garden.length,
    itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
      var gardenModel = data.garden[itemIndex];
      return gardenUi(
          gardenModel.image ?? "",
          gardenModel.name ?? "",
          gardenModel.temp ?? 0.0,
          gardenModel.soil ?? "",
          gardenModel.humidity ?? 0,
          gardenModel.id.toString());
    });
