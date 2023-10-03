import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_data.dart';
import 'widget_popover.dart';

class LayoutPartCentral extends StatefulWidget {
  const LayoutPartCentral({super.key});

  @override
  LayoutPartCentralState createState() => LayoutPartCentralState();
}

class LayoutPartCentralState extends State<LayoutPartCentral> {
  final GlobalKey _settingsButtonKey = GlobalKey();
  Color lastTextColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    AppData appData = Provider.of<AppData>(context);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CupertinoButton(
              padding: const EdgeInsets.all(0.0),
              onPressed: appData.toggleSidebarLeft,
              child: Icon(
                CupertinoIcons.sidebar_left,
                color: appData.isSidebarLeftVisible
                    ? CupertinoColors.activeBlue
                    : CupertinoColors.black,
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
            ),
            const SizedBox(
              width: 16,
            )
          ],
        ),
        middle: CupertinoButton(
          key: _settingsButtonKey,
          padding: const EdgeInsets.all(0.0),
          onPressed: () {
            WidgetPopover.showPopover(
                context: context,
                key: _settingsButtonKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          appData.changeColor("black");
                          updateLastTextColor(appData.isColor);
                          WidgetPopover.hidePopover();
                        },
                        child: const Text('Negre'),
                      ),
                      GestureDetector(
                        onTap: () {
                          appData.changeColor("red");
                          updateLastTextColor(appData.isColor);
                          WidgetPopover.hidePopover();
                        },
                        child: const Text('Vermell'),
                      ),
                      GestureDetector(
                        onTap: () {
                          appData.changeColor("green");
                          updateLastTextColor(appData.isColor);
                          WidgetPopover.hidePopover();
                        },
                        child: const Text('Verd'),
                      ),
                      GestureDetector(
                        onTap: () {
                          appData.changeColor("blue");
                          updateLastTextColor(appData.isColor);
                          WidgetPopover.hidePopover();
                        },
                        child: const Text('Blau'),
                      ),
                    ],
                  ),
                ));
          },
          child: const Icon(
            CupertinoIcons.settings,
            color: CupertinoColors.black,
            size: 24.0,
            semanticLabel: 'Text to announce in accessibility modes',
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CupertinoButton(
              padding: const EdgeInsets.all(0.0),
              onPressed: appData.toggleSidebarRight,
              child: Icon(
                CupertinoIcons.sidebar_right,
                color: appData.isSidebarRightVisible
                    ? CupertinoColors.activeBlue
                    : CupertinoColors.black,
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
            ),
            const SizedBox(
              width: 16,
            )
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Central",
              style: TextStyle(color: appData.isColor),
            )
          ],
        ),
      ),
    );
  }

  void updateLastTextColor(Color newColor) {
    setState(() {
      lastTextColor = newColor;
    });
  }
}
