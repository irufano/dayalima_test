import 'package:dayalima_test/src/data/models/widgets/dialogs/alert_dialog_request.dart';
import 'package:dayalima_test/src/data/models/widgets/dialogs/optional_detail_dialog_request.dart';
import 'package:dayalima_test/src/data/models/widgets/dialogs/optional_dialog_request.dart';
import 'package:dayalima_test/src/presentation/widgets/dialogs/custom_icon_dialog.dart';
import 'package:dayalima_test/src/presentation/widgets/dialogs/option_detail_dialog.dart';
import 'package:dayalima_test/src/presentation/widgets/dialogs/option_dialog.dart';
import 'package:flutter/material.dart';

import '../services/dialog_service.dart';
import '../services/locator_service.dart';

class DialogManager extends StatefulWidget {
  final Widget child;

  DialogManager({
    Key key,
    this.child,
  }) : super(key: key);

  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  DialogService _dialogService = locator<DialogService>();

  @override
  void initState() {
    super.initState();
    _dialogService.registerDialogListener(
      _showIconDialog,
      _showOptionDialog,
      _showOptionDetailDialog,
      _popDialog,
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showIconDialog(AlertDialogRequest request) {
    showDialog(
      context: context,
      builder: (BuildContext context) => CustomIconDialog(
        title: request.title,
        description: request.description,
        buttonText: request.buttonText,
        iconData: request.iconData,
        circleColor: request.circleColor,
        onPress: request.onPress,
      ),
    );
  }

  void _showOptionDialog(OptionDialogRequest request) {
    showDialog(
      context: context,
      builder: (BuildContext context) => OptionDialog(
        optionTitle: request.optionTitle,
        cancelTitle: request.cancelTitle,
        optionOnPress: request.optionOnPress,
        cancelOnPress: request.cancelOnPress,
      ),
    );
  }

  void _showOptionDetailDialog(OptionDetailDialogRequest request) {
    showDialog(
      context: context,
      builder: (BuildContext context) => OptionDetailDialog(
        title: request.title,
        description: request.description,
        cancelText: request.cancelText,
        optionText: request.optionText,
        iconData: request.iconData,
        circleColor: request.circleColor,
        cancelOnPress: request.cancelOnPress,
        optionOnPress: request.optionOnPress,
      ),
    );
  }

  void _popDialog() {
    Navigator.of(context).pop();
  }
}
