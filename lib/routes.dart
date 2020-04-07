import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_security/screens/home/home.dart';
import 'package:flutter_bloc_security/screens/login/login.dart';
import 'package:flutter_bloc_security/screens/register/register.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/login' : (context) => LoginScreen(),
  '/register' : (context) => RegisterScreen(),
  '/home' : (context) => HomeScreen(),
};