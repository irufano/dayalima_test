import 'dart:async';
import 'package:dayalima_test/src/data/models/widgets/dialogs/alert_dialog_request.dart';
import 'package:dayalima_test/src/data/models/widgets/dialogs/optional_detail_dialog_request.dart';
import 'package:dayalima_test/src/data/models/widgets/dialogs/optional_dialog_request.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DialogService {
  Function(AlertDialogRequest) _showDialogListener;
  Function(OptionDialogRequest) _showOptionDialogListener;
  Function(OptionDetailDialogRequest) _showOptionDetailDialogListener;
  Function _popDialogListener;
  Completer _dialogCompleter;

  /// Registers a callback function. Typically to show the dialog
  void registerDialogListener(
    Function showDialogListener,
    Function showOptionDialogListener,
    Function showOptionDetailDialogListener,
    Function popDialogListener,
  ) {
    _showDialogListener = showDialogListener;
    _showOptionDialogListener = showOptionDialogListener;
    _showOptionDetailDialogListener = showOptionDetailDialogListener;
    _popDialogListener = popDialogListener;
  }

  /// Calls the dialog listener and returns a Future that will wait for dialogComplete.
  Future showDialog({
    @required String title,
    @required String description,
    @required Function onPress,
    String buttonText = 'OK',
    IconData iconData = MdiIcons.alertCircleOutline,
    Color circleColor = Colors.orange
  }) {
    _dialogCompleter = Completer();
    _showDialogListener(AlertDialogRequest(
      title: title,
      description: description,
      buttonText: buttonText,
      iconData: iconData,
      circleColor: circleColor,
      onPress: onPress,
    ));
    return _dialogCompleter.future;
  }

  Future showOptionDialog({
    @required String optionTitle,
    @required String cancelTitle,
    @required Function optionOnPress,
    @required Function cancelOnPress,
  }) {
    _dialogCompleter = Completer();
    _showOptionDialogListener(OptionDialogRequest(
      optionTitle: optionTitle,
      optionOnPress: optionOnPress,
      cancelTitle: cancelTitle,
      cancelOnPress: cancelOnPress,
    ));
    return _dialogCompleter.future;
  }

  Future showOptionDetailDialog({
    @required String title,
    @required String description,
    @required Function optionOnPress,
    @required Function cancelOnPress,
    String optionText = 'Yes',
    String cancelText = 'Cancel',
    IconData iconData = MdiIcons.alertCircleOutline,
    Color circleColor = Colors.orange
  }) {
    _dialogCompleter = Completer();
    _showOptionDetailDialogListener(OptionDetailDialogRequest(
      title: title,
      description: description,
      optionText: optionText,
      cancelText: cancelText,
      iconData: iconData,
      circleColor: circleColor,
      optionOnPress: optionOnPress,
      cancelOnPress: cancelOnPress,
    ));
    return _dialogCompleter.future;
  }

  void popDialog() {
    _dialogCompleter.complete();
    _popDialogListener();
    _dialogCompleter = null;
  }

  /// Completes the _dialogCompleter to resume the Future's execution call
  void dialogComplete() {
    _dialogCompleter.complete();
    _dialogCompleter = null;
  }
}
