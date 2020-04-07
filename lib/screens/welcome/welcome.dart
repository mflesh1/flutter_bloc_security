import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_security/components/components.dart';

import '../../localizations.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.fromLTRB(16.0, 70.0, 16.0, 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(AppLocalizations.of(context).translate("welcome_title"), style: Theme.of(context).textTheme.title),
          SizedBox(height: 30.0),
          PrimaryOutlineButton(
            label: AppLocalizations.of(context).translate("welcome_create_account"),
            onPressed: () {
              Navigator.pushNamed(context, '/register');
            },
          ),
          SizedBox(height: 30.0),
          Center(
            child: RichText(
              text: TextSpan(
                text: AppLocalizations.of(context).translate("welcome_no_account"),
                style: Theme.of(context).textTheme.body1,
                children: <TextSpan>[
                  TextSpan(
                      text: AppLocalizations.of(context).translate("welcome_login"),
                      style:
                          TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: Theme.of(context).textTheme.body1.fontSize),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, '/login');
                        })
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}