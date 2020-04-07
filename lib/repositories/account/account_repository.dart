import 'dart:async';

import 'package:flutter_bloc_security/models/models.dart';

/*
 * Defines methods for interacting with an account.
 */
abstract class AccountRepository {

  Future<User> getUser();
  Future<User> login(String username, String password);
  Future<User> create(String name, String email, String password, bool pushEnabled, bool emailEnabled);
  Future<User> addCustomer(String accessCode);

}