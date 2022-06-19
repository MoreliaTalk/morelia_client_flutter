import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:morelia_client_flutter/modules/application_mode.dart';

enum AdaptiveMenuMode { fullscreen, split }

class AdaptiveMenu extends HookWidget {
  const AdaptiveMenu({
    Key? key,
    required this.mode,
    required this.items,
    this.menuFlexWidth = 1,
    this.subPageFlexWidth = 1,
  }) : super(key: key);

  final AdaptiveMenuMode mode;
  final List<AdaptiveMenuItem> items;
  final int menuFlexWidth;
  final int subPageFlexWidth;

  @override
  Widget build(BuildContext context) {
    var currentSubPage = useState<Widget>(Container());

    switch (mode) {
      case AdaptiveMenuMode.split:
        return Row(children: [
          Expanded(
              flex: menuFlexWidth,
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      child: items[index].widget,
                      onTap: () {
                        currentSubPage.value = items[index].subPage;
                      },
                    );
                  })),
          Expanded(flex: subPageFlexWidth, child: currentSubPage.value)
        ]);
      case AdaptiveMenuMode.fullscreen:
        return ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                  child: items[index].widget,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Scaffold(
                                appBar: AppBar(
                                  title: items[index].subPageText,
                                ),
                                body: items[index].subPage)));
                  });
            });
    }
  }
}

class AdaptiveMenuItem {
  AdaptiveMenuItem({
    required this.widget,
    required this.subPage,
    required this.subPageText,
  });

  final Widget widget;
  final Widget subPage;
  final Text subPageText;
}
