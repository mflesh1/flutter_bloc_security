import 'package:flutter/material.dart';

class SwitchField extends StatelessWidget {

  bool switched;

  SwitchField(this.switched);

  @override
  Widget build(BuildContext context) => Switch(
    value: switched,
    onChanged: (value) {
        switched = value;
    },
    activeTrackColor: Theme.of(context).primaryColorLight,
    activeColor: Theme.of(context).primaryColor,
  );

  bool isSwitched() {
    return switched;
  }

}
