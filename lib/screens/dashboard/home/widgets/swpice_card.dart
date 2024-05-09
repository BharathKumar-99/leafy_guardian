import 'package:flutter/material.dart';
import 'dart:math' as math;

class ExampleCard extends StatelessWidget {
  const ExampleCard({
    required this.subtitle,
    required this.title,
    required this.index,
    super.key,
  });

  final String subtitle;
  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: index % 2 == 0 ? -math.pi / 100 : -math.pi / 50,
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(20),
        child: Container(
            clipBehavior: Clip.antiAlias,
            height: MediaQuery.of(context).size.height * 0.17,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 5.0, top: 15),
                        child: Column(
                          children: [Icon(Icons.info_rounded), Spacer()],
                        ),
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              title,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              subtitle,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
