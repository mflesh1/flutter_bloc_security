import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:flutter_bloc_security/models/models.dart';
import 'package:flutter_bloc_security/repositories/account/account_repository.dart';
import 'package:flutter_bloc_security/repositories/app_exception.dart';

import 'login.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final AccountRepository accountRepository;

  LoginBloc({@required this.accountRepository});

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is Login) {
      yield* _mapLoginToState(event);
    }
  }

  Stream<LoginState> _mapLoginToState(Login login) async* {
    yield LoginLoading();
    try {
      final User user = await accountRepository.login(login.username, login.password);
      yield LoginLoaded(user: user);
    } on AppException catch(e) {
      yield LoginFailure(e.code, e.getMessage());
  }
  }
}