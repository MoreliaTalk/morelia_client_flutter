import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VerticalMenuBar extends StatelessWidget {
  const VerticalMenuBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Spacer(),
      Material(
        color: Theme.of(context).colorScheme.secondary,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(28.0),
        ),
        child: IconButton(
          onPressed: () {
            GoRouter.of(context).push("/settings");
          },
          color: Theme.of(context).colorScheme.onSecondary,
          icon: const Icon(Icons.settings),
          iconSize: 40,
        ),
      )
    ]);
  }
}
