import 'package:equatable/equatable.dart';

abstract class AddCustomerEvent extends Equatable {

  @override
  List<Object> get props => [];

}

class AddingCustomerEvent extends AddCustomerEvent {

  final String accesCode;

  AddingCustomerEvent(this.accesCode);

  @override
  List<Object> get props => [this.accesCode];

}