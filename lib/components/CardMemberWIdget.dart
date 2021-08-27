import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:trallo/model/CardMemberModel.dart';

class CardMemberWidget extends StatefulWidget {
  List<CardMembersModel>? cardMembersModel;

  CardMemberWidget({this.cardMembersModel});

  @override
  _CardMemberWidgetState createState() => _CardMemberWidgetState();
}

class _CardMemberWidgetState extends State<CardMemberWidget> {
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
      width: 350,
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          CardMembersModel data = widget.cardMembersModel![index];

          return Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Stack(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: Image.network(data.profileImg!).image,
                        ),
                        10.width,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data.name!, style: boldTextStyle()),
                            Text(data.userName!),
                          ],
                        ),
                      ],
                    ),
                    data.isActive
                        ? Positioned(
                            right: 0,
                            top: 10,
                            child: Icon(Icons.done, color: Colors.red),
                          )
                        : 0.height,
                  ],
                ),
                Divider(
                  thickness: 1,
                ),
              ],
            ),
          ).onTap(() {
            data.isActive = !data.isActive;
            setState(() {});
          });
        },
        itemCount: widget.cardMembersModel?.length ?? 0,
      ),
    );
  }
}
