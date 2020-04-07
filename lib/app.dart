import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc_security/injection.dart';
import 'package:flutter_bloc_security/screens/home/home.dart';
import 'package:flutter_bloc_security/repositories/data_repository.dart';
import 'package:flutter_bloc_security/routes.dart';
import 'package:flutter_bloc_security/screens/welcome/welcome.dart';
import 'package:flutter_bloc_security/theme/style.dart';

import 'localizations.dart';
import 'bloc/authentication/barrel.dart';
import 'components/loading_indicator.dart';

class App extends StatefulWidget {

  @override
  State<App> createState() => _AppState();

}

class _AppState extends State<App> {
  AuthBloc _authenticationBloc;

  @override
  void initState() {
    super.initState();
    _authenticationBloc = AuthBloc(dataRepository: getIt<DataRepository>());
    _authenticationBloc.add(LoadingEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) {
        return AuthBloc(dataRepository: getIt<DataRepository>())..add(LoadingEvent());
      },
      child: MaterialApp(
        home: flutter_bloc_security()
      ),
    );
  }
}

class flutter_bloc_security extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme(),
      supportedLocales: [Locale('en', 'US')],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode && supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        // If the locale of the device is not supported, use the first one
        return supportedLocales.first;
      },
      title: 'flutter_bloc_security',
      home: BlocBuilder<AuthBloc, AuthState>(
        bloc: BlocProvider.of<AuthBloc>(context),
        builder: (context, state) {
          if (state is AuthenticatedState) {
            return HomeScreen();
          }
          if (state is UnauthenticatedState) {
            return WelcomeScreen();
          }
          return LoadingIndicator();
        },
      ),
      routes: routes,
    );
  }

}
