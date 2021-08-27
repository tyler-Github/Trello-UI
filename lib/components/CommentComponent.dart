import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:trallo/model/CommentModel.dart';
import 'package:trallo/utils/TCWidgets.dart';

class CommentComponent extends StatefulWidget {
  final String? name;

  CommentComponent({this.name});

  @override
  _CommentComponentState createState() => _CommentComponentState();
}

class _CommentComponentState extends State<CommentComponent> {
  List<CommentModel> commentList = [];
  String selectedEmoji = '';

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
    return Container(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.messenger_outline_outlined),
              20.width,
              TextFormField(
                controller: TextEditingController(text: ''),
                style: TextStyle(fontSize: 16, color: Colors.black),
                cursorColor: Colors.black,
                minLines: 1,
                decoration: TCTextFieldInputDecoration(color: Colors.black, labelText: 'Add comment', padding: EdgeInsets.fromLTRB(0, 8, 0, 8)),
                onFieldSubmitted: (v) {
                  commentList.add(
                    CommentModel(image: 'https://images.unsplash.com/photo-1532074205216-d0e1f4b87368?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80', content: v, focus: false, selectedEmoji: selectedEmoji, name: widget.name, time: 'Just now'),
                  );
                  selectedEmoji = '';
                  setState(() {});
                },
              ).expand(),
            ],
          ),
          10.height,
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              CommentModel data = commentList[index];
              return Container(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(radius: 25, backgroundImage: Image.network(data.image!).image).paddingTop(10),
                    10.width,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(data.name.validate(), style: boldTextStyle(size: 14)),
                            PopupMenuButton(
                              itemBuilder: (context) {
                                List<PopupMenuEntry<Object>> list = [];
                                list.add(
                                  PopupMenuItem(child: Text('Edit'), value: 'Edit'),
                                );
                                list.add(
                                  PopupMenuItem(child: Text('Delete'), value: 'Delete'),
                                );
                                return list;
                              },
                              onSelected: (dynamic v) {
                                if (v == 'Edit') {
                                  data.focus = true;
                                } else {
                                  commentList.remove(data);
                                }
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                        TextField(
                          controller: TextEditingController(text: data.content),
                          maxLines: 6,
                          minLines: 1,
                          keyboardType: TextInputType.text,
                          autofocus: data.focus!,
                          onSubmitted: (v) {
                            data.content = v;
                            data.focus = false;
                            setState(() {});
                          },
                          style: primaryTextStyle(size: 12),
                          decoration: new InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            isDense: true,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                                    margin: EdgeInsets.only(top: 5),
                                    padding: EdgeInsets.fromLTRB(12, 4, 12, 4),
                                    decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.circular(20)),
                                    child: Icon(Icons.emoji_emotions_sharp).onTap(() {
                                      // showDialog(
                                      //   useSafeArea: true,
                                      //   builder: (_) => EmojiPicker(
                                      //     buttonMode: ButtonMode.CUPERTINO,
                                      //     rows: 3,
                                      //     columns: 7,
                                      //     recommendKeywords: ["racing", "horse"],
                                      //     numRecommended: 5,
                                      //     onEmojiSelected: (Emoji emoji, Category category) {
                                      //       data.selectedEmoji = emoji.emoji;
                                      //       setState(() {});
                                      //       finish(context);
                                      //     },
                                      //   ),
                                      //   context: context,
                                      // );
                                    }))
                                .visible(
                              data.selectedEmoji!.isEmpty,
                              defaultWidget: Container(
                                  margin: EdgeInsets.only(top: 5),
                                  padding: EdgeInsets.fromLTRB(12, 4, 12, 4),
                                  decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.circular(20)),
                                  child: Text(
                                    data.selectedEmoji!,
                                    style: boldTextStyle(size: 20),
                                  ).onTap(() {
                                    /*    showDialog(
                                      useSafeArea: true,
                                      builder: (_) => EmojiPicker(
                                        buttonMode: ButtonMode.CUPERTINO,
                                        rows: 3,
                                        columns: 7,
                                        recommendKeywords: ["racing", "horse"],
                                        numRecommended: 5,
                                        onEmojiSelected: (Emoji emoji, Category category) {
                                          data.selectedEmoji = emoji.emoji;
                                          setState(() {});
                                          finish(context);
                                        },
                                      ),
                                      context: context,
                                    );*/
                                  })),
                            ),
                            10.width,
                            Text(data.time.validate()),
                          ],
                        )
                      ],
                    ).expand()
                  ],
                ),
              );
            },
            itemCount: commentList.length,
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
          )
        ],
      ),
    );
  }
}
