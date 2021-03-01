
import 'package:flutter/material.dart';

import '../../styles/style.dart';

class OptionDialog extends StatefulWidget {
  final String optionTitle, cancelTitle;
  final Function optionOnPress, cancelOnPress;

  OptionDialog({
    Key key,
    @required this.optionTitle,
    @required this.cancelTitle,
    @required this.optionOnPress,
    @required this.cancelOnPress,
  }) : super(key: key);
  @override
  _OptionDialogState createState() => _OptionDialogState();
}

class _OptionDialogState extends State<OptionDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(
            top: 16.0,
            bottom: 16.0,
            left: 16.0,
            right: 16.0,
          ),
          margin: EdgeInsets.only(top: 0.0, left: 20, right: 20),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Material(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min, // To make the card compact
              children: <Widget>[
                ListTile(
                  title: Text(
                    widget.optionTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: widget.optionOnPress,
                ),
                SizedBox(
                  height: 2.0,
                  width: double.infinity,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Styles.greyColor()),
                  ),
                ),
                ListTile(
                  title: Text(
                    widget.cancelTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.red[300],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: widget.cancelOnPress,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
