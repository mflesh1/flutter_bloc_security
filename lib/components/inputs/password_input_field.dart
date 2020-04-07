import 'package:flutter/material.dart';

class PasswordInputField extends StatelessWidget {
  String label;
  bool validate;

  PasswordInputField() {
    this.label = "Password";
    this.validate = true;
  }

  PasswordInputField.validate(validate) {
    this.label = "Password";
    this.validate = validate;
  }

  PasswordInputField.all(label, validate) {
    this.label = label;
    this.validate = validate;
  }

  String _value;

  @override
  Widget build(BuildContext context) => TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: this.label,
        ),
        validator: validator,
        onSaved: (value) => _value = value,
      );

  String validator(String value) {
    if (this.validate) {
      Pattern pattern = r'.{8,}$';
      RegExp regex = new RegExp(pattern);
      if (!regex.hasMatch(value)) return 'Password must be at least 8 characters.';
    }
    if (value == null || value.isEmpty) return 'Password is required.';
    return null;
  }

  String getValue() {
    return _value;
  }
}
