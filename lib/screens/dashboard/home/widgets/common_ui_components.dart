import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leafy_guardian/utils/routes/routes_constants.dart';

addPlants() => Builder(builder: (context) {
      return ElevatedButton(
          onPressed: () => context.push(RoutesConstants().addPlants),
          child: const Text("Add Plants"));
    });
