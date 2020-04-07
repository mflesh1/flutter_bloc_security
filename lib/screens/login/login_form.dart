import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_security/bloc/authentication/barrel.dart';
import 'package:flutter_bloc_security/components/buttons/primary_button.dart';
import 'package:flutter_bloc_security/components/inputs/inputs.dart';
import 'package:flutter_bloc_security/components/inputs/password_input_field.dart';
import 'package:flutter_bloc_security/components/loading_indicator.dart';
import 'package:flutter_bloc_security/repositories/account/account_repository.dart';

import '../../injection.dart';
import 'bloc/login.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return LoginBloc(accountRepository: getIt<AccountRepository>());
      },
      child: MainForm(),
    );
  }
}

class MainForm extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final emailField = new EmailInputField();
    final passwordField = new PasswordInputField.validate(false);
    final loginButton = new PrimaryButton(
      label: "Login",
      onPressed: () {
        if (_formKey.currentState.validate()) {
          _formKey.currentState.save();
          BlocProvider.of<LoginBloc>(context).add(new Login(emailField.getValue(), passwordField.getValue()));
        }
      },
    );

    return BlocListener<LoginBloc, LoginState>(

      listener: (context, state) {
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.message}'),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is LoginLoaded) {
          Navigator.of(context).pop(context);
          BlocProvider.of<AuthBloc>(context).add(new AuthorizedEvent(state.user));
        }
      },

      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      emailField,
                      SizedBox(height: 25.0),
                      passwordField,
                      SizedBox(
                        height: 35.0,
                      ),
                      Container(
                        child: state is LoginLoading
                            ? null
                            : loginButton,
                      ),
                      Container(
                        child: state is LoginLoading
                            ? LoadingIndicator()
                            : null,
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