import 'package:equatable/equatable.dart';

abstract class ScreenState extends Equatable {

  const ScreenState();

  @override
  List<Object> get props => [];

}

class InitialScreenState extends ScreenState {}

class FailureScreenState extends ScreenState {

  final int code;
  final String message;

  FailureScreenState(this.code, this.message);

  @override
  List<Object> get props => [code, message];

}