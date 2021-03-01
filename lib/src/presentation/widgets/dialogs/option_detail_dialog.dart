import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../styles/style.dart';

class OptionDetailDialog extends StatefulWidget {
  final String title, description, cancelText, optionText;
  final IconData iconData;
  final Color circleColor;
  final Function cancelOnPress, optionOnPress;

  OptionDetailDialog({
    Key key,
    @required this.title,
    @required this.description,
    @required this.cancelText,
    @required this.optionText,
    this.iconData = MdiIcons.checkBold,
    this.circleColor = Colors.blueAccent,
    @required this.cancelOnPress,
    @required this.optionOnPress,
  }) : super(key: key);
  @override
  _OptionDetailDialogState createState() => _OptionDetailDialogState();
}

class _OptionDetailDialogState extends State<OptionDetailDialog> {
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
          padding: EdgeInsets.only(
            top: 48.0 + 16.0,
            bottom: 16.0,
            left: 16.0,
            right: 16.0,
          ),
          margin: EdgeInsets.only(top: 66.0),
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
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                widget.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton(
                      onPressed: widget.optionOnPress,
                      color: Styles.primaryColor(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Text(
                        widget.optionText,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.white
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: widget.cancelOnPress,
                      color: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Text(
                        widget.cancelText,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Circle top
        Positioned(
          left: 16.0,
          right: 16.0,
          top: 16.0,
          child: CircleAvatar(
            backgroundColor: widget.circleColor,
            radius: 48.0,
            child: Icon(
              widget.iconData,
              size: 48,
              color: Styles.lightColor(),
            ),
          ),
        ),
      ],
    );
  }
}
