import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:trallo/screens/TCSettingsScreen.dart';
import 'package:trallo/screens/TCSignInScreen.dart';
import 'package:trallo/utils/TCWidgets.dart';

class DrawerComponent extends StatefulWidget {
  @override
  _DrawerComponentState createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  bool isExpandable = true;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            arrowColor: Colors.white,
            onDetailsPressed: () {
              isExpandable = !isExpandable;
              setState(() {});
            },
            currentAccountPicture: Image.network('https://i.pinimg.com/600x315/80/63/35/8063359effd01b990e653bb32a83485d.jpg').cornerRadiusWithClipRRect(50),
            accountName: Text('Lee', style: boldTextStyle(color: Colors.white, size: 16)),
            accountEmail: Text('@leegada1', style: primaryTextStyle(color: Colors.white, size: 14)),
          ),
          Container(
            child: ListView(
              shrinkWrap: true,
              children: [
                DrawerList(
                  leading: Icon(Feather.clipboard),
                  title: "Boards",
                  onTap: () {
                    finish(context);
                  },
                ),
                10.height,
                DrawerList(
                  leading: Icon(
                    SimpleLineIcons.settings,
                  ),
                  title: "Settings",
                  onTap: () {
                    finish(context);
                    TCSettingsScreen().launch(context);
                  },
                ),
                10.height,
                DrawerList(
                  leading: Icon(MaterialCommunityIcons.help_circle_outline),
                  title: "Help!",
                  onTap: () {
                    toast('Coming Soon');
                  },
                ),
                10.height,
                DrawerList(
                  leading: Icon(SimpleLineIcons.logout),
                  title: "Logout",
                  onTap: () {
                    finish(context);
                    TCSignInScreen().launch(context, isNewTask: true);
                  },
                ),
              ],
            ),
          ).visible(isExpandable),
          DrawerList(
            leading: Icon(Icons.add),
            title: "Add Account",
            onTap: () {
              toast('Coming Soon');
            },
          ).visible(!isExpandable),
        ],
      ),
    );
  }
}
