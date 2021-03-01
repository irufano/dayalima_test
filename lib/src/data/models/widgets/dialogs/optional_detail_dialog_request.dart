import 'package:flutter/material.dart';

class OptionDetailDialogRequest {
  String title;
  String description;
  String optionText;
  String cancelText;
  IconData iconData;
  Color circleColor;
  Function optionOnPress;
  Function cancelOnPress;

  OptionDetailDialogRequest({
    @required this.title,
    @required this.description,
    @required this.optionText,
    @required this.cancelText,
    @required this.iconData,
    @required this.circleColor,
    @required this.optionOnPress,
    @required this.cancelOnPress,
  });
}
