
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryOutlineButton extends StatelessWidget {

  final String label;
  final VoidCallback onPressed;

  PrimaryOutlineButton({this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      color: Colors.white,
      shape: RoundedRectangleBorder(side: BorderSide(
          color: Colors.black,
          width: 1,
          style: BorderStyle.solid
      ), borderRadius: BorderRadius.circular(5)),
      child: Text(
          label,
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.body1.fontSize
          ),
      ),
      onPressed: () {
        if (this.onPressed != null) {
          this.onPressed();
        }
      },
    );
  }

}