import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {

  @override
  List<Object> get props => [];

}

class RegisteringEvent extends RegisterEvent {

  final String name;
  final String email;
  final String password;
  final bool pushEnabled;
  final bool emailEnabled;

  RegisteringEvent(this.name, this.email, this.password, this.pushEnabled, this.emailEnabled);

  @override
  List<Object> get props => [this.name, this.email, this.password, this.pushEnabled, this.emailEnabled];

}