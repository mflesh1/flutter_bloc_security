import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc_security/bloc/screen_state.dart';

import 'package:flutter_bloc_security/models/models.dart';
import 'package:flutter_bloc_security/repositories/account/account_repository.dart';
import 'package:flutter_bloc_security/repositories/app_exception.dart';
import 'package:flutter_bloc_security/repositories/data_repository.dart';

import 'barrel.dart';

class AddCustomerBloc extends Bloc<AddCustomerEvent, ScreenState> {

  final AccountRepository accountRepository;
  final DataRepository dataRepository;

  AddCustomerBloc({@required this.accountRepository, @required this.dataRepository});

  @override
  ScreenState get initialState => InitialScreenState();

  @override
  Stream<ScreenState> mapEventToState(AddCustomerEvent event) async* {
    if (event is AddingCustomerEvent) {
      yield* _mapAddingCustomerToState(event);
    }
  }

  Stream<ScreenState> _mapAddingCustomerToState(AddingCustomerEvent event) async* {
    yield AddingCustomerState();
    try {
      final User user = await accountRepository.addCustomer(event.accesCode);
      await dataRepository.setUser(user);
      yield AddedCustomerState();
    } on AppException catch(e) {
      yield FailureScreenState(e.code, e.getMessage());
  }
  }


}