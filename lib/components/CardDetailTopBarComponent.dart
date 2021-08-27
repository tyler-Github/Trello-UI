import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:trallo/utils/AppColors.dart';
import 'package:trallo/utils/TCColors.dart';

class CardDetailTopBarComponent extends StatefulWidget {
  final String? name;

  CardDetailTopBarComponent({this.name});

  @override
  _CardDetailTopBarComponentState createState() => _CardDetailTopBarComponentState();
}

class _CardDetailTopBarComponentState extends State<CardDetailTopBarComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back, color: iconColorPrimary),
                onPressed: () {
                  finish(context);
                },
              ),
              IconButton(
                  icon: Icon(Icons.more_vert_outlined, color: iconColorPrimary),
                  onPressed: () {
                    toast('Coming soon');
                  })
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          Text(widget.name!, style: boldTextStyle(size: 20, color: Colors.white)).paddingAll(16),
          Text('Prokit in list Proapps list', style: boldTextStyle(size: 14, color: Colors.white)).paddingLeft(16).paddingBottom(16)
        ],
      ),
    );
  }
}
