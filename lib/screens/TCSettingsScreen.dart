import 'package:trallo/utils/AppColors.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:trallo/model/SettingsModel.dart';
import 'package:trallo/utils/TCColors.dart';

class TCSettingsScreen extends StatefulWidget {
  @override
  _TCSettingsScreenState createState() => _TCSettingsScreenState();
}

class _TCSettingsScreenState extends State<TCSettingsScreen> {
  List<SettingsModel> settings = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    settings.add(
      SettingsModel(
        name: 'Notification',
        subName: 'Open System Settings',
        icon: Icon(
          Ionicons.ios_notifications_outline,
          size: 35,
        ),
      ),
    );
    settings.add(
      SettingsModel(
        name: 'Application Theme',
        subName: 'Select theme',
        icon: Icon(
          MaterialCommunityIcons.theme_light_dark,
          size: 30,
        ),
      ),
    );
    settings.add(
      SettingsModel(
        name: 'Accessibility',
        subName: 'Color Blind Friendly Mode',
        icon: Icon(
          Icons.accessibility_new_outlined,
          size: 30,
        ),
      ),
    );
    settings.add(
      SettingsModel(
        name: 'Sync',
        subName: 'Offline Boards ',
        icon: Icon(
          MaterialCommunityIcons.sync_icon,
          size: 30,
        ),
      ),
    );
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  Widget generalSetting() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            SimpleLineIcons.settings,
            size: 30,
          ),
          15.width,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              5.height,
              Text('General Setting', style: boldTextStyle(color: buttonColor)),
              10.height,
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text('Profile and Visibility', style: primaryTextStyle()),
                    contentPadding: EdgeInsets.all(0),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Create card defaults', style: primaryTextStyle()),
                    contentPadding: EdgeInsets.all(0),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Delete Account', style: primaryTextStyle()),
                    contentPadding: EdgeInsets.all(0),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('About Trello', style: primaryTextStyle()),
                    contentPadding: EdgeInsets.all(0),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Report a Bug', style: primaryTextStyle()),
                    contentPadding: EdgeInsets.all(0),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Log out', style: primaryTextStyle()),
                    contentPadding: EdgeInsets.all(0),
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ).expand(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text('Settings'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: iconColorPrimary),
          onPressed: () {
            finish(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: settings.length,
              itemBuilder: (context, index) {
                SettingsModel data = settings[index];
                return Container(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      data.icon!,
                      15.width,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.name!, style: boldTextStyle(color: buttonColor)),
                          10.height,
                          Text(data.subName!, style: primaryTextStyle()),
                        ],
                      ).expand(),
                    ],
                  ),
                ).onTap(() {});
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
            ),
            10.height,
            generalSetting(),
          ],
        ),
      ),
    );
  }
}
