import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_security/models/models.dart';

abstract class AuthState extends Equatable {

  const AuthState();

  @override
  List<Object> get props => [];

}

class AuthenticationUnknown extends AuthState{}

class AuthenticatedState extends AuthState{
  final User user;

  AuthenticatedState(this.user);
}

class UnauthenticatedState extends AuthState{}