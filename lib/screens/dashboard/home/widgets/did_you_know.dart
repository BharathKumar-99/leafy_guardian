import 'package:flutter/material.dart';
import 'package:leafy_guardian/provider/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:swipable_stack/swipable_stack.dart';
import 'swpice_card.dart';

class DidYouKnow extends StatefulWidget {
  const DidYouKnow({
    super.key,
  });

  @override
  State<DidYouKnow> createState() => _DidYouKnowState();
}

class _DidYouKnowState extends State<DidYouKnow> {
  late final SwipableStackController _controller;

  void _listenController() => setState(() {});

  @override
  void initState() {
    super.initState();
    _controller = SwipableStackController()..addListener(_listenController);
  }

  @override
  void dispose() {
    super.dispose();
    _controller
      ..removeListener(_listenController)
      ..dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, data, widget) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SwipableStack(
          detectableSwipeDirections: const {
            SwipeDirection.right,
            SwipeDirection.left,
          },
          controller: _controller,
          stackClipBehaviour: Clip.none,
          horizontalSwipeThreshold: 0.8,
          verticalSwipeThreshold: 0.8,
          builder: (context, properties) {
            final itemIndex = data.didYouKnowModel.isNotEmpty
                ? properties.index % data.didYouKnowModel.length
                : 0;

            return Stack(
              children: [
                ExampleCard(
                  title: 'Did you know?',
                  subtitle: data.didYouKnowModel.isEmpty
                      ? ""
                      : data.didYouKnowModel[itemIndex].fact ?? "",
                  index: itemIndex,
                ),
                // more custom overlay possible than with overlayBuilder
              ],
            );
          },
        ),
      );
    });
  }
}
