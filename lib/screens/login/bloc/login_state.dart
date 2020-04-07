import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc_security/models/models.dart';

abstract class LoginState extends Equatable {

  const LoginState();

  @override
  List<Object> get props => [];

}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {

  final User user;

  const LoginLoaded({@required this.user}) : assert(user != null);

  @override
  List<Object> get props => [user];
}

class LoginFailure extends LoginState {

  final int code;
  final String message;

  LoginFailure(this.code, this.message);

  @override
  List<Object> get props => [code, message];

}