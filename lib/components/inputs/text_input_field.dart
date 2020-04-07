import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  String label;
  FormFieldValidator<String> validator;

  TextInputField({@required this.label, this.validator});

  String _value;

  @override
  Widget build(BuildContext context) => TextFormField(
        obscureText: false,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: this.label,
        ),
        validator: validator,
        onSaved: (value) => _value = value,
      );

  String getValue() {
    return _value;
  }
}
