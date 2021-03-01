import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../styles/style.dart';

class CustomIconDialog extends StatefulWidget {
  final String title, description, buttonText;
  final IconData iconData;
  final Color circleColor;
  final Function onPress;

  CustomIconDialog({
    Key key,
    @required this.title,
    @required this.description,
    @required this.buttonText,
    this.iconData = MdiIcons.checkBold,
    this.circleColor = Colors.blueAccent,
    @required this.onPress,
  }) : super(key: key);
  @override
  _CustomIconDialogState createState() => _CustomIconDialogState();
}

class _CustomIconDialogState extends State<CustomIconDialog> {
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
                style: TextStyle(
                  fontSize: 24.0,
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
                child: FlatButton(
                  onPressed: widget.onPress,
                  child: Text(
                    widget.buttonText,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
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
