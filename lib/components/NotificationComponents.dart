import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:trallo/utils/AppColors.dart';
import 'package:trallo/utils/CustomTabView.dart';
import 'package:trallo/utils/TCColors.dart';

class NotificationComponents extends StatefulWidget {
  @override
  _NotificationComponentsState createState() => _NotificationComponentsState();
}

class _NotificationComponentsState extends State<NotificationComponents> {
  List<Widget> list = [
    Container(
        child: ListView.builder(
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (context, index) {
        return Container(
          decoration: boxDecorationWithRoundedCorners(
            borderRadius: BorderRadius.circular(0),
            /* border: Border(
              left: BorderSide(width: 2),
            ),*/
          ),
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(top: 1),
          child: Row(
            children: [
              Icon(
                Icons.access_time_sharp,
                size: 40,
              ),
              10.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  createRichText(list: [
                    TextSpan(text: 'Lee\'s ', style: boldTextStyle(size: 14)),
                    TextSpan(text: 'on ', style: primaryTextStyle(size: 14)),
                    TextSpan(text: 'Project name', style: boldTextStyle(size: 14)),
                    TextSpan(text: 'was due ', style: primaryTextStyle(size: 14)),
                    TextSpan(text: 'Nov 8, 9:00', style: boldTextStyle(size: 14)),
                  ]),
                  Text('7 hours ago ', style: primaryTextStyle(size: 12)),
                ],
              )
            ],
          ),
        );
      },
    )),
    Text("No Notification", style: TextStyle(fontSize: 18)).center(),
    Text("No Notification", style: TextStyle(fontSize: 18)).center(),
  ];

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

  List name = ['All', 'Me', 'Comments'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          leading: CloseButton(
            color: iconColorPrimary,
          ),
          title: Text('Notifications', style: boldTextStyle(size: 18, color: Colors.white)),
          actions: [
            IconButton(
              icon: Icon(Icons.check_box_outlined, color: iconColorPrimary),
              onPressed: null,
            ),
            PopupMenuButton(
              icon: Icon(Icons.more_vert_outlined, color: iconColorPrimary),
              itemBuilder: (BuildContext context) {
                List<PopupMenuEntry<Object>> list = [];
                list.add(
                  PopupMenuItem(child: Text("Push notification settings "), value: 1),
                );
                return list;
              },
            )
          ],
        ),
        body: CustomTabView(
          initPosition: 0,
          itemCount: 3,
          tabBuilder: (context, index) {
            return Container(padding: EdgeInsets.all(16), child: Text(name[index], textAlign: TextAlign.center));
          },
          pageBuilder: (context, index) {
            return list[index];
          },
        ),
      ),
    );
  }
}
