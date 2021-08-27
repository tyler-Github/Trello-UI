import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:trallo/screens/TCWalkThroughScreen.dart';
import 'package:trallo/utils/TCColors.dart';
import 'package:trallo/utils/TCConstants.dart';

class TCSplashScreen extends StatefulWidget {
  @override
  _TCSplashScreenState createState() => _TCSplashScreenState();
}

class _TCSplashScreenState extends State<TCSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    checkFirstSeen();
  }

  Future checkFirstSeen() async {
    await Future.delayed(Duration(seconds: 2));
    finish(context);
    TCWalkThroughScreen().launch(context);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Text(
        TCAppName,
        style: boldTextStyle(size: 55, color: Colors.white, letterSpacing: 1),
      ).center(),
    );
  }
}
