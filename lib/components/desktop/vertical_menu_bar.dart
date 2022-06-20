import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:morelia_client_flutter/modules/router/app_router.dart';

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
            context.router.pushNamed("settings");
          },
          color: Theme.of(context).colorScheme.onSecondary,
          icon: const Icon(Icons.settings),
          iconSize: 40,
        ),
      )
    ]);
  }
}
