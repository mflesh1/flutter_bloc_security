import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:flutter_bloc_security/models/models.dart';

import '../../injection.dart';
import 'account_repository.dart';
import '../app_exception.dart';

@RegisterAs(AccountRepository, env: Env.mock)
@injectable
class MockAccountRepository implements AccountRepository {

  User user;

  MockAccountRepository() {
    user = User(
        name: "Joe Smith",
        token: "token"
    );
  }

  Future<User> login(String username, String password) {
    return Future.delayed(
      Duration(seconds: 1),
          () {
        if (username.toLowerCase() == "test@test.com") {
          return user;
        }
        throw UnauthorizedException("Invalid username and/or password.");
      },
    );
  }

  @override
  Future<User> getUser() {
    return Future.delayed(
      Duration(seconds: 1),
          () {
          return user;
      },
    );
  }

  @override
  Future<User> create(String name, String email, String password, bool pushEnabled, bool emailEnabled) {
    return Future.delayed(
      Duration(seconds: 1),
          () {
        return user;
      },
    );
  }

  @override
  Future<User> addCustomer(String accessCode) {
    if (accessCode != "abc") {
      throw new AppException(0, ["Invalid access code."]);
    }
    return Future.delayed(
      Duration(seconds: 1),
          () {
        return user;
      },
    );
  }

}