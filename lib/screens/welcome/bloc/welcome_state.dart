import 'package:equatable/equatable.dart';

abstract class WelcomeState extends Equatable {

  const WelcomeState();

  @override
  List<Object> get props => [];

}

class WelcomeInitial extends WelcomeState {}