import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:trallo/screens/TCDashboardScreen.dart';
import 'package:trallo/utils/TCColors.dart';
import 'package:trallo/utils/TCConstants.dart';
import 'package:trallo/utils/TCWidgets.dart';

class TCSignUpScreen extends StatefulWidget {
  @override
  _TCSignUpScreenState createState() => _TCSignUpScreenState();
}

class _TCSignUpScreenState extends State<TCSignUpScreen> {
  bool isShowOtherDetails = false;
  bool isEmailValid = false;
  var formKey = GlobalKey<FormState>();
  var emailCont = TextEditingController();
  var nameCont = TextEditingController();
  var passwordCont = TextEditingController();
  bool isPassword = false;

  @override
  void initState() {
    super.initState();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  void _counterButtonPress() {
    if (!isShowOtherDetails) {
      isShowOtherDetails = true;
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
        body: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.always,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            children: [
              TextFormField(
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                cursorColor: Colors.white,
                decoration: TCTextFieldInputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                controller: emailCont,
                onChanged: (v) {
                  isEmailValid = v.toString().trim().validateEmail();
                  setState(() {});
                  if (isEmailValid = v.toString().trim().validateEmail()) {
                    isShowOtherDetails = false;
                    setState(() {});
                  }
                },
                validator: (String? s) {
                  if (s!.trim().isEmpty) return 'Please enter a valid email address';
                  if (!s.validateEmail()) return 'Email Id not Valid';
                  return null;
                },
              ),
              Column(
                children: [
                  TextFormField(
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    decoration: TCTextFieldInputDecoration(labelText: "Name"),
                    controller: nameCont,
                  ),
                  TextFormField(
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
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
                  ),
                ],
              ).visible(isShowOtherDetails),
              15.height,
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Cancel'.toUpperCase(), style: primaryTextStyle(color: textColorPrimary, letterSpacing: 1)).onTap(() {
                    finish(context);
                  }),
                  15.width,
                  RaisedButton(
                    disabledColor: Colors.green.withOpacity(0.5),
                    disabledTextColor: textColorPrimary.withOpacity(0.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      isShowOtherDetails ? signUp : "Next",
                      style: primaryTextStyle(color: textColorPrimary, letterSpacing: 1),
                    ),
                    color: buttonColor,
                    onPressed: isEmailValid ? _counterButtonPress : null,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
