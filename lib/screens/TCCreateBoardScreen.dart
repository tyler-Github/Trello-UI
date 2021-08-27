import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:trallo/main.dart';
import 'package:trallo/model/PersonalBoardsModel.dart';
import 'package:trallo/model/WorkSpaceBoardModel.dart';
import 'package:trallo/utils/AppColors.dart';
import 'package:trallo/utils/TCColors.dart';
import 'package:trallo/utils/TCWidgets.dart';

class TCCreateBoardScreen extends StatefulWidget {
  @override
  _TCCreateBoardScreenState createState() => _TCCreateBoardScreenState();
}

class _TCCreateBoardScreenState extends State<TCCreateBoardScreen> {
  String? teamValue = '1';
  String visibilityValue = '1';
  List<PersonalBoardModel> personalBoardModel = [];
  List<WorkSpaceBoardModel> workspaceModel = [];
  var boardNameCont = TextEditingController();
  bool focus = true;

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: CloseButton(
          color: iconColorPrimary,
          onPressed: () {
            finish(context);
          },
        ),
        title: Text('Create Board', style: boldTextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.done, color: iconColorPrimary),
            onPressed: () {
              tcBoardStore.addItem(
                PersonalBoardModel(name: boardNameCont.text, starred: false, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT5guHEUeNVd1Uc_6NdURM_7h5P6UcDE1U_Lw&usqp=CAU", team: teamValue, visibility: visibilityValue),
              );
              finish(context);
            },
          )
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                autofocus: focus,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                cursorColor: Colors.black,
                decoration: TCTextFieldInputDecoration(labelText: "Board Name", color: Colors.black),
                controller: boardNameCont,
              ),
              20.height,
              Text(
                'Team',
                style: boldTextStyle(size: 12),
              ),
              5.height,
              DropdownButton(
                isExpanded: true,
                value: teamValue,
                onChanged: (dynamic value) {
                  teamValue = value;
                  setState(() {});
                },
                items: [
                  DropdownMenuItem(child: Text('Personal Boards (no team)'), value: '1'),
                  DropdownMenuItem(child: Text('Lee\'s workspace'), value: '2'),
                ],
              ),
              20.height,
              Text(
                'Visibility',
                style: boldTextStyle(size: 12),
              ),
              10.height,
              DropdownButton(
                isExpanded: true,
                value: visibilityValue,
                items: [
                  DropdownMenuItem(child: Text('Private', style: primaryTextStyle(color: Colors.black)), value: '1'),
                  DropdownMenuItem(child: Text('Public', style: primaryTextStyle(color: Colors.black)), value: '2'),
                ],
                onChanged: (String? value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
