import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:trallo/screens/TCSignInScreen.dart';
import 'package:trallo/screens/TCSignUpScreen.dart';
import 'package:trallo/utils/AppWidget.dart';
import 'package:trallo/utils/TCColors.dart';
import 'package:trallo/utils/TCConstants.dart';
import 'package:trallo/utils/TCImages.dart';
import 'package:trallo/utils/TCWidgets.dart';

class TCWalkThroughScreen extends StatefulWidget {
  @override
  _TCWalkThroughScreenState createState() => _TCWalkThroughScreenState();
}

class _TCWalkThroughScreenState extends State<TCWalkThroughScreen> {
  var pageController = PageController();
  List<Widget> pages = [];
  var selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    pages = [
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(W1title, style: boldTextStyle(color: textColorPrimary, size: 22, letterSpacing: 0)),
          Text(W1SubTitle, style: primaryTextStyle(color: textColorPrimary)),
          40.height,
          commonCacheImageWidget(tc_WalkThroughImg1.validate(), height: 230),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          commonCacheImageWidget(tc_WalkThroughImg2.validate(), height: 230),
          40.height,
          Text(W2title, style: boldTextStyle(color: textColorPrimary, size: 18, letterSpacing: 0)),
          Text(W2SubTitle, style: primaryTextStyle(color: textColorPrimary)),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          commonCacheImageWidget(tc_WalkThroughImg3.validate(), height: 250),
          40.height,
          Text(W3title, style: boldTextStyle(color: textColorPrimary, size: 18, letterSpacing: 0)),
          Text(W3SubTitle, style: primaryTextStyle(color: textColorPrimary)),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          commonCacheImageWidget(tc_WalkThroughImg4.validate(), height: 250),
          40.height,
          Text(W4title, style: boldTextStyle(color: textColorPrimary, size: 18, letterSpacing: 0)),
          Text(W4SubTitle, style: primaryTextStyle(color: textColorPrimary)),
        ],
      ),
    ];
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: Wrap(
              children: <Widget>[
                BottomSheets(icon: Image.asset('images/teamCollaboration/trello/email.png', height: 35, width: 40), title: email).onTap(() {
                  TCSignUpScreen().launch(context);
                }),
                BottomSheets(icon: Image.asset('images/teamCollaboration/trello/google.png', height: 35, width: 40), title: google).onTap(() {
                  toast("Google");
                }),
                BottomSheets(icon: Image.asset('images/teamCollaboration/trello/microsoft.png', height: 35, width: 40), title: microsoft).onTap(() {
                  toast("MicroSoft");
                }),
                BottomSheets(icon: Image.asset('images/teamCollaboration/trello/apple.png', height: 35, width: 40), title: apple).onTap(() {
                  toast("Apple");
                }),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Widget body() {
      return SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: context.height() * .8,
                  child: PageView(
                    controller: pageController,
                    scrollDirection: Axis.horizontal,
                    children: pages,
                    onPageChanged: (index) {
                      selectedIndex = index;
                      setState(() {});
                    },
                  ),
                ),
                AnimatedPositioned(
                  duration: Duration(seconds: 1),
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: DotIndicator(pages: pages, indicatorColor: Colors.white, pageController: pageController),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              width: context.width(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RaisedButton(
                        onPressed: () {
                          _settingModalBottomSheet(context);
                        },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        padding: EdgeInsets.all(14),
                        child: Text(signUp, style: primaryTextStyle(color: textColorPrimary, size: 12)),
                        color: buttonColor,
                      ),
                      RaisedButton(
                        onPressed: () {
                          TCSignInScreen().launch(context);
                        },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        padding: EdgeInsets.all(14),
                        child: Text(logIn, style: primaryTextStyle(color: textColorPrimary, size: 12)),
                        color: buttonColor,
                      ),
                    ],
                  ),
                  20.height,
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(text: termsCondition1, style: secondaryTextStyle(color: textColorSecondary, size: 12)),
                        TextSpan(text: termsCondition2, style: boldTextStyle(color: textColorPrimary, size: 12)),
                        TextSpan(text: termsCondition3, style: secondaryTextStyle(color: textColorSecondary, size: 12)),
                        TextSpan(text: termsCondition4, style: boldTextStyle(color: textColorPrimary, size: 12)),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: body(),
      ),
    );
  }
}
