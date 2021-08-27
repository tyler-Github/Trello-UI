import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:trallo/components/DrawerComponent.dart';
import 'package:trallo/components/FABbuttonComponent.dart';
import 'package:trallo/components/NotificationComponents.dart';
import 'package:trallo/main.dart';
import 'package:trallo/model/PersonalBoardsModel.dart';
import 'package:trallo/screens/TCBoardsDetailScreen.dart';
import 'package:trallo/utils/AppColors.dart';
import 'package:trallo/utils/TCColors.dart';

class TCDashboardScreen extends StatefulWidget {
  @override
  _TCDashboardScreenState createState() => _TCDashboardScreenState();
}

class _TCDashboardScreenState extends State<TCDashboardScreen> {
  GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();

  bool isOpen = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    tcBoardStore.personalBoardModel.clear();
    tcBoardStore.addItem(PersonalBoardModel(name: "Example 1", starred: true, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT5guHEUeNVd1Uc_6NdURM_7h5P6UcDE1U_Lw&usqp=CAU", team: ""));
    tcBoardStore.addItem(PersonalBoardModel(name: "Example 2", starred: false, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSf7LUrmYngtfypab22AFEYYDcUaRAVqzGTew&usqp=CAU", team: ""));
  }

  _handleDrawer() {
    _key.currentState!.openDrawer();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    Widget dashboardAppBar(BuildContext context) {
      return AppBar(
        leading: IconButton(
          icon: Icon(MaterialIcons.menu, color: iconColorPrimary, size: 30),
          onPressed: () {
            _handleDrawer();
          },
        ),
        backgroundColor: backgroundColor,
        title: Text(
          'Boards',
          style: boldTextStyle(color: Colors.white, size: 18),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.search, color: iconColorPrimary),
              onPressed: () {
                toast('Coming soon');
              }),
          IconButton(
            icon: Icon(Icons.notifications_none, color: iconColorPrimary),
            onPressed: () {
              NotificationComponents().launch(context);
            },
          ),
        ],
      );
    }

    int length = 0;
    tcBoardStore.personalBoardModel.forEach((element) {
      if (element.starred == true) {
        length = tcBoardStore.personalBoardModel.length;
      } else {
        length = 0;
      }
    });

    return SafeArea(
      child: Scaffold(
          key: _key,
          drawer: DrawerComponent(),
          appBar: dashboardAppBar(context) as PreferredSizeWidget?,
          body: ListView(
            shrinkWrap: true,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: boxDecorationWithShadow(blurRadius: 5, spreadRadius: 2),
                    child: Text(
                      'Personal boards',
                      style: boldTextStyle(),
                    ).paddingAll(10),
                  ),
                  10.height,
                  Observer(
                    builder: (_) => ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: tcBoardStore.personalBoardModel.length,
                      itemBuilder: (BuildContext context, int index) {
                        PersonalBoardModel data = tcBoardStore.personalBoardModel[index];
                        return ListTile(
                          onTap: () {
                            TCBoardsDetailScreen(
                              name: tcBoardStore.personalBoardModel[index].name,
                              index: index,
                            ).launch(context);
                          },
                          leading: Image.network(
                            data.image!,
                            height: 40,
                            width: 40,
                            fit: BoxFit.cover,
                          ).cornerRadiusWithClipRRect(2),
                          title: Text(
                            data.name.toString(),
                            style: boldTextStyle(),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
          floatingActionButton: FABbuttonComponent()),
    );
  }
}
