import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:morelia_client_flutter/components/common/settings_page.dart';

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
            showDialog(context: context, builder: (BuildContext context) => const Dialog(
              child: FractionallySizedBox(
                widthFactor: 0.3,
                heightFactor: 1,
                child: SettingsPage()
              ),
            ));
          },
          color: Theme.of(context).colorScheme.onSecondary,
          icon: const Icon(Icons.settings),
          iconSize: 40,
        ),
      )
    ]);
  }
}