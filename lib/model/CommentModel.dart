import 'package:flutter/material.dart';

class CommentModel {
  String? image;
  String? name;
  String? content;
  bool? focus;
  String? time;
  String? selectedEmoji;
  TextEditingController? textEditingController;

  CommentModel({this.image, this.name, this.textEditingController, this.content, this.focus, this.time, this.selectedEmoji});
}
