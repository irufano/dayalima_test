import 'package:flutter/material.dart';

class AlertDialogRequest {
  String title;
  String description;
  String buttonText;
  IconData iconData;
  Color circleColor;
  Function onPress;

  AlertDialogRequest({
    @required this.title,
    @required this.description,
    @required this.buttonText,
    @required this.iconData,
    @required this.circleColor,
    @required this.onPress,
  });
}
