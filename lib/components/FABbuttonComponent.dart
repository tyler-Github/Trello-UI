import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:trallo/main.dart';
import 'package:trallo/model/WorkSpaceBoardModel.dart';
import 'package:trallo/screens/TCCreateBoardScreen.dart';
import 'package:trallo/utils/AppColors.dart';
import 'package:trallo/utils/TCColors.dart';

class FABbuttonComponent extends StatefulWidget {
  @override
  _FABbuttonComponentState createState() => _FABbuttonComponentState();
}

class _FABbuttonComponentState extends State<FABbuttonComponent> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => SpeedDial(
        childMargin: EdgeInsets.only(right: 18, bottom: 20),
        // animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22.0),
        closeManually: false,
        curve: Curves.easeInOut,
        backgroundColor: buttonColor,
        foregroundColor: iconColorPrimary,
        child: !tcStore.isOptionVisible ? Icon(Icons.add) : Icon(Icons.remove),
        onOpen: () {
          tcStore.toggleFABOption();
        },
        onClose: () {
          tcStore.toggleFABOption();
        },
        children: [
          SpeedDialChild(
            child: Icon(Icons.dashboard, color: iconColorPrimary),
            backgroundColor: buttonColor,
            label: 'Board',
            labelStyle: TextStyle(fontSize: 14.0),
            onTap: () async {
              WorkSpaceBoardModel? result = await TCCreateBoardScreen().launch(context);
              log(result);
            },
          ),
        ],
      ),
    );
  }
}
