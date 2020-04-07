import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_security/localizations.dart';
import 'package:flutter_bloc_security/bloc/authentication/barrel.dart';
import 'package:flutter_bloc_security/bloc/authentication/bloc.dart';
import 'package:flutter_bloc_security/components/buttons/primary_button.dart';
import 'package:flutter_bloc_security/components/inputs/inputs.dart';
import 'package:flutter_bloc_security/components/inputs/password_input_field.dart';
import 'package:flutter_bloc_security/components/loading_indicator.dart';
import 'package:flutter_bloc_security/injection.dart';
import 'package:flutter_bloc_security/repositories/account/account_repository.dart';
import 'package:flutter_bloc_security/repositories/data_repository.dart';
import 'package:flutter_bloc_security/theme/constants.dart';

import 'bloc/register.dart';

class RegisterForm extends StatefulWidget {
  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return RegisterBloc(accountRepository: getIt<AccountRepository>(), dataRepository: getIt<DataRepository>());
      },
      child: MainForm(),
    );
  }
}

class MainForm extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final nameField = new TextInputField(
      label: "Full Name",
      validator: (value) {
        if (value.isEmpty) {
          return 'Enter your name.';
        }
        return null;
      },
    );
    final emailField = new EmailInputField();
    final passwordField = new PasswordInputField();
    final pushNotificationField = new SwitchField(true);
    final emailNotificationField = new SwitchField(false);
    final submitButton = new PrimaryButton(
      label: "Next",
      onPressed: () {
        if (_formKey.currentState.validate()) {
          _formKey.currentState.save();
          BlocProvider.of<RegisterBloc>(context).add(new RegisteringEvent(
              nameField.getValue(), emailField.getValue(), passwordField.getValue(), pushNotificationField.isSwitched(), emailNotificationField.isSwitched()));
        }
      },
    );

    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.message}'),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is Registered) {
          Navigator.of(context).pop(context);
          BlocProvider.of<AuthBloc>(context).add(new AuthorizedEvent(state.user));
        }
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        bloc: BlocProvider.of<RegisterBloc>(context),
        builder: (context, state) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      nameField,
                      SizedBox(height: Constants.formElementPadding),
                      emailField,
                      SizedBox(height: Constants.formElementPadding),
                      passwordField,
                      SizedBox(height: Constants.formElementPadding),
                      Text(AppLocalizations.of(context).translate("register_password_req")),
                      SizedBox(height: 16),
                      Text(AppLocalizations.of(context).translate("register_notification_desc")),
                      SizedBox(height: 16),
                      Row(
                        children: <Widget>[pushNotificationField, Text(AppLocalizations.of(context).translate("register_push_notifications"))],
                      ),
                      SizedBox(height: Constants.formElementPadding),
                      Row(
                        children: <Widget>[emailNotificationField, Text(AppLocalizations.of(context).translate("register_email_notifications"))],
                      ),
                      SizedBox(height: Constants.formElementPadding),
                      Container(
                        child: state is Registering ? null : submitButton,
                      ),
                      Container(
                        child: state is Registering ? LoadingIndicator() : null,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
