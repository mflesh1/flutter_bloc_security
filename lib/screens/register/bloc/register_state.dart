import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc_security/models/models.dart';

abstract class RegisterState extends Equatable {

  const RegisterState();

  @override
  List<Object> get props => [];

}

class RegisterInitial extends RegisterState {}

class Registering extends RegisterState {}

class Registered extends RegisterState {

  final User user;

  const Registered({@required this.user}) : assert(user != null);

  @override
  List<Object> get props => [user];
}

class RegisterFailure extends RegisterState {

  final int code;
  final String message;

  RegisterFailure(this.code, this.message);

  @override
  List<Object> get props => [code, message];

}