import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:trallo/screens/TCDashboardScreen.dart';
import 'package:trallo/utils/TCColors.dart';
import 'package:trallo/utils/TCConstants.dart';
import 'package:trallo/utils/TCWidgets.dart';

class TCSignInScreen extends StatefulWidget {
  @override
  _TCSignInScreenState createState() => _TCSignInScreenState();
}

class _TCSignInScreenState extends State<TCSignInScreen> {
  bool isEnable = false;
  bool isNext = false;

  var emailCont = TextEditingController();
  var passwordCont = TextEditingController();

  bool isPassword = false;

  var emailFocus = FocusNode();
  var passwordFocus = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  void _counterPart() {
    if (!isNext) {
      isNext = true;
      setState(() {});
    } else {
      TCDashboardScreen().launch(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Stack(
          children: [
            Column(
              children: [
                TextFormField(
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  autofocus: true,
                  cursorColor: Colors.white,
                  decoration: TCTextFieldInputDecoration(labelText: "Email"),
                  keyboardType: TextInputType.emailAddress,
                  controller: emailCont,
                  autofillHints: [AutofillHints.email],
                  onFieldSubmitted: (v) {
                    isEnable = v.toString().trim().isNotEmpty;
                    setState(() {});
                    FocusScope.of(context).requestFocus(passwordFocus);
                  },
                  onChanged: (v) {
                    isEnable = v.toString().trim().isNotEmpty;
                    setState(() {});
                  },
                ),
                15.height,
                TextFormField(
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  obscureText: isPassword,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: GestureDetector(
                      onTap: () {
                        isPassword = !isPassword;
                        setState(() {});
                      },
                      child: Icon(
                        isPassword ? Icons.visibility : Icons.visibility_off,
                        color: Colors.white,
                      ),
                    ),
                    labelStyle: primaryTextStyle(color: Colors.white),
                    errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                    focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                    errorMaxLines: 2,
                    errorStyle: primaryTextStyle(color: Colors.red, size: 12),
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                    border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  ),
                  onChanged: (v) {},
                ).visible(isNext),
                15.height,
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RaisedButton(
                        disabledColor: Colors.green.withOpacity(0.5),
                        disabledTextColor: textColorPrimary.withOpacity(0.0),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          !isNext ? "Next" : "Log in",
                          style: primaryTextStyle(color: textColorPrimary, letterSpacing: 1),
                        ),
                        color: buttonColor,
                        onPressed: isEnable ? _counterPart : null),
                  ],
                )
              ],
            ).paddingAll(16),
            Positioned(
              bottom: 0,
              child: Container(
                width: context.width(),
                color: Colors.white,
                child: Column(
                  children: [
                    BottomSheets(icon: Image.asset('images/trello/google.png', height: 35, width: 40), title: google).onTap(() {
                      toast("Google");
                    }),
                    BottomSheets(icon: Image.asset('images/trello/microsoft.png', height: 35, width: 40), title: microsoft).onTap(() {
                      toast("MicroSoft");
                    }),
                    BottomSheets(icon: Image.asset('images/trello/apple.png', height: 35, width: 40), title: apple).onTap(() {
                      toast("Apple");
                    }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
