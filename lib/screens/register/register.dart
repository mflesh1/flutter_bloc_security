import 'package:flutter/material.dart';
import 'package:flutter_bloc_security/screens/register/register_form.dart';

import '../../localizations.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(AppLocalizations.of(context).translate("register_title")),
      ),
      body: RegisterForm(),
    );
  }
}
