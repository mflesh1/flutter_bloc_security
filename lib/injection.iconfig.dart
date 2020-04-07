// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_bloc_security/repositories/data_repository.dart';
import 'package:flutter_bloc_security/repositories/account/mock_account_repository.dart';
import 'package:flutter_bloc_security/repositories/account/account_repository.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  g.registerFactory<DataRepository>(() => DataRepository());

  //Register mock Dependencies --------
  if (environment == 'mock') {
    g.registerFactory<AccountRepository>(() => MockAccountRepository());
  }
}
