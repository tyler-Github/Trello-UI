import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:trallo/main.dart';
import 'package:trallo/model/EndDrawerModel.dart';
import 'package:trallo/utils/TCWidgets.dart';

class EndDrawerComponent extends StatefulWidget {
  final int? index;

  EndDrawerComponent({this.index});

  @override
  _EndDrawerComponentState createState() => _EndDrawerComponentState();
}

class _EndDrawerComponentState extends State<EndDrawerComponent> {
  List<EndDrawerModel> endDrawer = [];
  ContainerTransitionType _transitionType = ContainerTransitionType.fade;
  int? index;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    print(widget.index);
    index = widget.index;
    endDrawer.add(
      EndDrawerModel(
        leading: Icon(Feather.info),
        title: "About this board",
        contents: [],
        onTap: () {
          toast('Coming Soon');
        },
      ),
    );
    endDrawer.add(
      EndDrawerModel(
        leading: Icon(MaterialIcons.person_outline),
        title: "Members",
        contents: [],
        onTap: () {
          toast('Coming Soon');
        },
      ),
    );
    endDrawer.add(
      EndDrawerModel(
        leading: Icon(Feather.activity),
        title: "Activity",
        contents: [],
        onTap: () {
          toast('Coming Soon');
        },
      ),
    );
    endDrawer.add(
      EndDrawerModel(
        leading: Icon(SimpleLineIcons.rocket),
        title: "Power-Ups",
        contents: [],
        onTap: () {
          toast('Coming Soon');
        },
      ),
    );
    endDrawer.add(
      EndDrawerModel(
        leading: Icon(Feather.credit_card),
        title: "Archived cards",
        contents: [],
        onTap: () {
          toast('Coming Soon');
        },
      ),
    );
    endDrawer.add(
      EndDrawerModel(
        leading: Icon(MaterialCommunityIcons.format_list_checkbox),
        title: "Archived lists",
        contents: [],
        onTap: () {
          toast('Coming Soon');
        },
      ),
    );
    endDrawer.add(
      EndDrawerModel(
          leading: Icon(SimpleLineIcons.settings),
          title: "Board Settings",
          onTap: () {
            toast('Coming Soon');
          },
          contents: [
            ListTile(
              title: Text('AppClone'),
              subtitle: Text('Name'),
            )
          ]),
    );
    endDrawer.add(
      EndDrawerModel(
        leading: Icon(MaterialCommunityIcons.star_outline),
        title: "Star Board",
        contents: [],
        onTap: () {
          tcBoardStore.personalBoardModel[widget.index!].starred = !tcBoardStore.personalBoardModel[widget.index!].starred.validate();
        },
      ),
    );
    endDrawer.add(
      EndDrawerModel(
        leading: Icon(MaterialCommunityIcons.pin_outline),
        title: "Pin to home screen",
        contents: [],
        onTap: () {
          toast('Coming Soon');
        },
      ),
    );
    endDrawer.add(
      EndDrawerModel(
        leading: Icon(MaterialCommunityIcons.eye_outline),
        title: "Watch",
        contents: [],
        onTap: () {
          toast('Coming Soon');
        },
      ),
    );
    endDrawer.add(
      EndDrawerModel(
        leading: Icon(Icons.copy_outlined),
        title: "Copy board",
        contents: [],
        onTap: () {
          toast('Coming Soon');
        },
      ),
    );
    endDrawer.add(
      EndDrawerModel(
        leading: Icon(SimpleLineIcons.share),
        title: "Share board link",
        contents: [],
        onTap: () {
          toast('Coming Soon');
        },
      ),
    );
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  bool isTrue = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 16),
            itemCount: endDrawer.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.fromLTRB(0, 0, 1, 5),
                child: Column(
                  children: [
                    DrawerList(
                      leading: endDrawer[index].leading,
                      onTap: endDrawer[index].onTap,
                      title: endDrawer[index].title,
                    ),
                    Divider(color: Colors.black, thickness: 0).visible(index == 2 || index == 3 || index == 6)
                  ],
                ),
              );
            },
          ),
          DrawerList(
              leading: Icon(Icons.sync),
              title: "Synced",
              onTap: () {
                toast('Coming Soon');
              }).paddingBottom(10),
        ],
      )),
    );
  }
}
