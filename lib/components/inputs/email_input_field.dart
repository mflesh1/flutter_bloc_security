import 'package:flutter/material.dart';

class EmailInputField extends StatelessWidget {

  String label;

  EmailInputField([this.label = "Email"]);

  String _value;

  @override
  Widget build(BuildContext context) => TextFormField(
    obscureText: false,
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      labelText: this.label,
    ),
    validator: validateEmail,
    onSaved: (value) => _value = value,
  );

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter a valid email';
    else
      return null;
  }

  String getValue() {
    return _value;
  }

}