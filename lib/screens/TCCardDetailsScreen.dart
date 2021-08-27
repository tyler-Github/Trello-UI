import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:trallo/components/CardDetailTopBarComponent.dart';
import 'package:trallo/components/CardMemberWIdget.dart';
import 'package:trallo/components/CommentComponent.dart';
import 'package:trallo/model/BoardDetailOptionModel.dart';
import 'package:trallo/model/CardMemberModel.dart';
import 'package:trallo/utils/TCWidgets.dart';

class TCCardDetailsScreen extends StatefulWidget {
  final String? name;

  TCCardDetailsScreen({this.name = 'ankit'});

  @override
  _TCCardDetailsScreenState createState() => _TCCardDetailsScreenState();
}

class _TCCardDetailsScreenState extends State<TCCardDetailsScreen> {
  var dateTime = DateTime.now();
  var editCont = TextEditingController();
  List<BoardDetailOptionModel> boardDetailOptionModel = [];
  List<CardMembersModel> cardMembersModel = [];

  bool showLabel = true;
  bool showMembers = false;
  bool add = false;
  bool? showActivity = false;
  String? _selected;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future _dueDate(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Due Date', style: boldTextStyle(size: 20)),
          content: Container(
            width: 450,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                !add
                    ? Row(
                        children: [
                          Icon(Icons.access_time_rounded),
                          10.width,
                          Text('Add Due Date...'),
                        ],
                      ).onTap(
                        () {
                          add = true;
                          setState(() {});
                        },
                      )
                    : Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            DropdownButton(
                              isExpanded: true,
                              hint: Text('Enter date'),
                              value: _selected,
                              items: [DropdownMenuItem(child: Text('Today'), value: 's')],
                              onChanged: (String? value) {
                                _selected = value;
                                setState(() {});
                              },
                            ).expand(),
                            10.width,
                            DropdownButton(
                              isExpanded: true,
                              hint: Text('Enter time'),
                              value: _selected,
                              items: [
                                DropdownMenuItem(
                                  child: Text('Today'),
                                  value: 's',
                                )
                              ],
                              onChanged: (String? value) {
                                _selected = value;
                                setState(() {});
                              },
                            ).expand(),
                            20.width,
                            Icon(Icons.cancel_rounded).onTap(() {
                              add = false;
                              setState(() {});
                            })
                          ],
                        ),
                      ),
                10.height,
                Text(
                  'Set Reminder',
                  style: boldTextStyle(size: 16),
                ),
                !add
                    ? Row(
                        children: [
                          Icon(Icons.access_time_rounded),
                          10.width,
                          Text('Add Due Date...'),
                        ],
                      ).onTap(
                        () {
                          add = true;
                          setState(() {});
                        },
                      )
                    : Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            DropdownButton(
                              isExpanded: true,
                              hint: Text('set Reminder'),
                              value: _selected,
                              items: [DropdownMenuItem(child: Text('Today'), value: 's')],
                              onChanged: (String? value) {
                                _selected = value;
                                setState(() {});
                              },
                            ).expand(),
                            20.width,
                            Icon(Icons.cancel_rounded).onTap(() {
                              add = false;
                              setState(() {});
                            })
                          ],
                        ),
                      ),
                10.height,
                Text("Reminders are only sent to members and watchers of the card", style: primaryTextStyle(size: 14)),
              ],
            ),
          ),
          actions: [
            FlatButton(
              onPressed: () {
                finish(context);
              },
              child: Text('Cancel'.toUpperCase()),
            ),
            FlatButton(
              onPressed: () {
                finish(context);
              },
              child: Text('Done'.toUpperCase()),
            )
          ],
        );
      },
    );
  }

  void _memberDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Card Members', style: boldTextStyle(size: 20)),
          content: CardMemberWidget(cardMembersModel: cardMembersModel),
        );
      },
    );
    setState(() {});
  }

  init() async {
    boardDetailOptionModel.add(BoardDetailOptionModel(name: "labels", icon: Icon(Icons.label)));
    boardDetailOptionModel.add(BoardDetailOptionModel(name: "MembersMembers", icon: Icon(Icons.person_outline)));
    boardDetailOptionModel.add(BoardDetailOptionModel(name: "Due DateDue Date", icon: Icon(Icons.date_range)));
    boardDetailOptionModel.add(BoardDetailOptionModel(name: "ChecklistChecklist", icon: Icon(Icons.check_box_outlined)));
    boardDetailOptionModel.add(BoardDetailOptionModel(name: "AttachmentsAttachments", icon: Icon(Icons.attach_file)));

    cardMembersModel.add(CardMembersModel(name: 'ankit', profileImg: "https://i.pinimg.com/564x/d9/56/9b/d9569bbed4393e2ceb1af7ba64fdf86a.jpg", userName: "@ankit"));
    cardMembersModel.add(CardMembersModel(name: 'ankit', profileImg: "https://i.pinimg.com/564x/d9/56/9b/d9569bbed4393e2ceb1af7ba64fdf86a.jpg", userName: "@ankit"));
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    showMembers = false;
    cardMembersModel.forEach((element) {
      if (element.isActive) showMembers = true;
    });

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF4F5F7),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CardDetailTopBarComponent(name: widget.name),
              addDescription(),
              // detailsOptions(),
              ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.label),
                            20.width,
                            Text('labels'),
                          ],
                        ).onTap(() {
                          toast('Coming Soon');
                        }),
                        20.height,
                        !showMembers
                            ? Row(
                                children: [
                                  Icon(Icons.person_outline),
                                  20.width,
                                  Text('Members'),
                                ],
                              ).onTap(
                                () {
                                  _memberDialog();
                                },
                              )
                            : Container(
                                height: 75,
                                width: context.width(),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.person_outline),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: cardMembersModel.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        CardMembersModel data = cardMembersModel[index];
                                        return Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: CircleAvatar(radius: 22, backgroundImage: Image.network(data.profileImg!).image).visible(data.isActive),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ).onTap(
                                () {
                                  _memberDialog();
                                },
                              ),
                        20.height,
                        Row(
                          children: [
                            Icon(Icons.date_range),
                            20.width,
                            Text('Due Date'),
                          ],
                        ).onTap(() {
                          _dueDate(context);
                        }),
                        20.height,
                        Row(
                          children: [
                            Icon(Icons.check_box_outlined),
                            20.width,
                            Text('Checklist'),
                          ],
                        ).onTap(() {
                          toast('Coming Soon');
                        }),
                        20.height,
                        Row(
                          children: [
                            Icon(Icons.attach_file),
                            20.width,
                            Text('Attachment'),
                          ],
                        ).onTap(() {
                          toast('Coming Soon');
                        }),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 2,
              ),

              Container(
                padding: EdgeInsets.fromLTRB(16, 0, 8, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.local_activity_rounded),
                        20.width,
                        Text('Activity', style: boldTextStyle(color: Colors.black)),
                      ],
                    ),
                    PopupMenuButton(
                      icon: Icon(
                        Icons.more_vert_outlined,
                        size: 20,
                      ),
                      itemBuilder: (context) {
                        List<PopupMenuEntry<Object>> list = [];
                        list.add(
                          PopupMenuItem(
                            child: CheckboxListTile(
                                contentPadding: EdgeInsets.all(0),
                                title: FittedBox(child: Text('Show Activity')),
                                onChanged: (bool? value) {
                                  showActivity = value;
                                  setState(() {});
                                },
                                value: showActivity),
                          ),
                        );
                        return list;
                      },
                    ),
                  ],
                ),
              ),
              Divider(thickness: 2),
              CommentComponent(name: widget.name),
            ],
          ),
        ),
      ),
    );
  }

  Widget detailsOptions() {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: boardDetailOptionModel.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              children: [
                boardDetailOptionModel[index].icon!,
                20.width,
                Text(boardDetailOptionModel[index].name!),
              ],
            ),
          ).onTap(() {
            if (boardDetailOptionModel[index].name == 'Members') {
              _memberDialog();
            } else if (boardDetailOptionModel[index].name == 'labels') {
              toast('value');
            } else {
              _dueDate(context);
            }
          });
        },
      ),
    );
  }

  Widget addDescription() {
    return Container(
      decoration: boxDecorationRoundedWithShadow(0, offset: Offset(3, 6), spreadRadius: 0, blurRadius: 5),
      padding: EdgeInsets.all(8),
      child: TextFormField(
        maxLines: 5,
        minLines: 1,
        style: TextStyle(fontSize: 16, color: Colors.black),
        cursorColor: Colors.white,
        decoration: TCTextFieldInputDecoration(labelText: "Edit card description", color: Colors.black, padding: EdgeInsets.fromLTRB(0, 8, 0, 8)),
        keyboardType: TextInputType.emailAddress,
        controller: editCont,
        onFieldSubmitted: (v) {
          editCont.text = v;
          setState(() {});
        },
      ),
    );
  }
}
