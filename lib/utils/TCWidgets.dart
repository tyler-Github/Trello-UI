import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:trallo/utils/TCColors.dart';

class BottomSheets extends StatelessWidget {
  Widget? icon;
  String title;

  BottomSheets({
    this.icon,
    this.title = "Enter Text",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            icon!,
            10.width,
            Text(
              title.toUpperCase(),
              style: boldTextStyle(size: 14),
            ),
          ],
        ));
  }
}

class DrawerList extends StatelessWidget {
  Widget? leading;
  String? title;
  Function? onTap;

  DrawerList({this.leading, this.title = 'Enter Title', this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          leading!,
          20.width,
          Text(
            title!,
            style: primaryTextStyle(),
          ),
        ],
      ),
    ).onTap(onTap);
  }
}

// ignore: must_be_immutable
class CommonTextFormField extends StatefulWidget {
  bool isPassword;
  final String labelText;
  final String? hintText;

  final int fontSize;
  final Color? textColor;
  final String? fontFamily;
  final String text;
  final int maxLine;
  final int minLine;
  final Function? validator;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final TextInputType textInputType;
  final TextEditingController? mController;
  final String? prefixText;
  final VoidCallback? onPressed;
  final Function? onFieldSubmitted;
  final Function? onChanged;
  final Color textHintColor;
  bool? label = true;

  bool readOnly;
  bool autofocus;

  CommonTextFormField(
      {this.isPassword = false,
      this.labelText = "",
      this.fontSize = 16,
      this.textColor,
      this.hintText,
      this.fontFamily,
      this.text = "",
      this.focusNode,
      this.suffixIcon,
      this.textHintColor = textColorPrimary,
      this.validator,
      this.onFieldSubmitted,
      this.textInputType = TextInputType.text,
      this.maxLine = 1,
      this.minLine = 1,
      this.autofocus = false,
      this.prefixText,
      this.label,
      this.onChanged,
      this.mController,
      this.readOnly = false,
      this.onPressed});

  @override
  _CommonTextFormFieldState createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  @override
  void initState() {
    super.initState();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: widget.minLine,
      autofocus: widget.autofocus,
      maxLines: widget.maxLine,
      keyboardType: widget.textInputType,
      controller: widget.mController,
      obscureText: widget.isPassword,
      onTap: widget.onPressed,
      validator: widget.validator as String? Function(String?)?,
      focusNode: widget.focusNode,
      cursorColor: widget.textHintColor,
      onChanged: widget.onChanged as void Function(String)?,
      onFieldSubmitted: widget.onFieldSubmitted as void Function(String)?,
      style: TextStyle(
        fontSize: widget.fontSize.toDouble(),
        fontFamily: widget.fontFamily,
        color: widget.textHintColor,
      ),
      readOnly: widget.readOnly,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(0, 8, 16, 8),
        suffixIcon: widget.suffixIcon ??
            GestureDetector(
              onTap: () {
                widget.isPassword = !widget.isPassword;
                setState(() {});
              },
              child: Icon(
                widget.isPassword ? Icons.visibility : Icons.visibility_off,
                color: widget.textHintColor,
              ),
            ),
        labelText: widget.labelText,
        labelStyle: primaryTextStyle(color: widget.textHintColor),
        hintText: widget.hintText,
        hintStyle: primaryTextStyle(color: widget.textHintColor),
        prefixText: widget.prefixText,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        errorMaxLines: 2,
        errorStyle: primaryTextStyle(color: Colors.red, size: 12),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.textHintColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.textHintColor),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.textHintColor),
        ),
      ),
    );
  }
}

InputDecoration TCTextFieldInputDecoration({String? labelText, Color color = Colors.white, EdgeInsetsGeometry? padding}) {
  return InputDecoration(
    contentPadding: padding,
    labelText: labelText,
    labelStyle: primaryTextStyle(color: color),
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
    ),
    errorMaxLines: 2,
    errorStyle: primaryTextStyle(color: Colors.red, size: 12),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: color),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: color),
    ),
    border: UnderlineInputBorder(
      borderSide: BorderSide(color: color),
    ),
  );
}
