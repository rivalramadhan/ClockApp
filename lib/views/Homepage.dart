import 'package:clock_app/constants/theme_data.dart';
import 'package:clock_app/enums.dart';
import 'package:clock_app/menuinfo.dart';
import 'package:clock_app/views/clockpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data.dart';
import 'alarmpage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MenuInfo(MenuType.alarm),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: Color(0xff202f41),
            body: Row(
              children: <Widget>[
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: menuItems
                        .map((currentMenuInfo) =>
                            buildMenuButton(currentMenuInfo))
                        .toList()),
                VerticalDivider(
                  color: Colors.white54,
                  width: 1,
                ),
                Expanded(
                  child: Consumer<MenuInfo>(
                    builder:
                        (BuildContext context, MenuInfo value, Widget child) {
                      if (value.menuType == MenuType.clock)
                        return ClockPage();
                      else if (value.menuType == MenuType.alarm)
                        return AlarmPage();
                      else
                        return Container(
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(fontSize: 20),
                              children: <TextSpan>[
                                TextSpan(text: 'Coming Soon\n'),
                                TextSpan(
                                  text: value.title,
                                  style: TextStyle(fontSize: 48),
                                ),
                              ],
                            ),
                          ),
                        );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget buildMenuButton(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
        builder: (BuildContext context, MenuInfo value, Widget child) {
      // ignore: deprecated_member_use
      return FlatButton(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        color: currentMenuInfo.menuType == value.menuType
            ? CustomColors.menuBackgroundColor
            : Colors.transparent,
        onPressed: () {
          var menuInfo = Provider.of<MenuInfo>(context, listen: false);
          menuInfo.updateMenu(currentMenuInfo);
        },
        child: Column(
          children: <Widget>[
            Image.asset(
              currentMenuInfo.imageSource,
              scale: 1.5,
            ),
            SizedBox(height: 16),
            Text(
              currentMenuInfo.title ?? '',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ],
        ),
      );
    });
  }
}
