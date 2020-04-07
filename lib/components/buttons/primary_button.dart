
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {

  final String label;
  final VoidCallback onPressed;

  PrimaryButton({this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      color: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(5),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          if (this.onPressed != null) {
            this.onPressed();
          }
        },
        child: Text(
          this.label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.body1.fontSize,
            color: Colors.white
          ),
        ),
      ),
    );
  }

}