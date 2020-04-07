import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {

  @override
  List<Object> get props => [];

}

class Login extends LoginEvent {

  final String username;
  final String password;

  Login(this.username, this.password);

  @override
  List<Object> get props => [this.username, this.password];

}