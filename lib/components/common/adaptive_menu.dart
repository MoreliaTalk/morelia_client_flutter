import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:morelia_client_flutter/modules/platform_const.dart';

class AdaptiveMenu extends HookWidget {
  const AdaptiveMenu({Key? key, required this.items, required this.platform}) : super(key: key);

  final List<AdaptiveMenuItem> items;
  final TypePlatformDevices platform;

  @override
  Widget build(BuildContext context) {
    if (platform == TypePlatformDevices.desktop) {
      var currentSubPage = useState<Widget>(Container());

      return Row(children: [
        Expanded(child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(child: items[index].widget, onTap: () {
              currentSubPage.value = items[index].subPage;
            },);
          })),
          Expanded(flex: 6, child: currentSubPage.value)
      ]
      );
    }
    return Container();
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
