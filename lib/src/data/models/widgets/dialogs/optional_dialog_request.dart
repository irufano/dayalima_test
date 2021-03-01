import 'package:flutter/material.dart';

class OptionDialogRequest {
  String optionTitle;
  String cancelTitle;
  Function optionOnPress;
  Function cancelOnPress;

  OptionDialogRequest({
    @required this.optionTitle,
    @required this.cancelTitle,
    @required this.optionOnPress,
    @required this.cancelOnPress,
  });
}