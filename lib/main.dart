import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_security/injection.dart';

import 'app.dart';

class SimpleBlocDelegate extends BlocDelegate {

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

}

void main({String env = "mock"}) {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  configureInjection(env);
  runApp(App());
}


