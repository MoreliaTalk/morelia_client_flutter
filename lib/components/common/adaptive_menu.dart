import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:morelia_client_flutter/modules/platform_const.dart';

class AdaptiveMenu extends HookWidget {
  const AdaptiveMenu({Key? key, required this.items}) : super(key: key);

  final List<AdaptiveMenuItem> items;

  @override
  Widget build(BuildContext context) {
    var currentSubPage = useState<Widget>(Container());

    late Widget newWidget;

    if (currentPlatform == TypePlatformDevices.desktop) {
      newWidget = Row(children: [
        Expanded(child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(child: items[index].widget, onTap: () {
              currentSubPage.value = items[index].subPage;
            },);
          })),
          Expanded(flex: 5, child: currentSubPage.value)
      ]
      );
    } else if (currentPlatform == TypePlatformDevices.mobile) {
      newWidget = ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(child: items[index].widget, onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => items[index].subPage));
            });
          });
    }

    return newWidget;
  }
}

class AdaptiveMenuItem {
  AdaptiveMenuItem({
    required this.widget,
    required this.subPage,
  });

  final Widget widget;
  final Widget subPage;
}
