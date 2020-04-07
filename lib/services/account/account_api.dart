import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc_security/models/models.dart';
import 'package:flutter_bloc_security/services/account/requests/add_customer_request.dart';
import 'package:flutter_bloc_security/services/account/requests/requests.dart';

import '../api.dart';

class AccountApi extends Api {

  final http.Client httpClient;

  AccountApi({
    @required this.httpClient,
  }) : assert(httpClient != null);


  Future<User> login(LoginRequest request) async {

    final url = '$baseUrl/account/login';

    final response = await this.httpClient.post(url, body:jsonEncode(request.toJson()));

    if (response.statusCode != 200) {
      throw new Exception('error getting quotes');
    }

    final json = jsonDecode(response.body);

    return User.fromJson(json);

  }

  Future<User> create(CreateRequest request) async {

    final url = '$baseUrl/account';

    final response = await this.httpClient.post(url, body:jsonEncode(request.toJson()));

    if (response.statusCode != 200) {
      throw new Exception('error getting quotes');
    }

    final json = jsonDecode(response.body);

    return User.fromJson(json);

  }

  Future<User> getUser() async {

    final url = '$baseUrl/account';

    final response = await this.httpClient.get(url);

    if (response.statusCode != 200) {
      throw new Exception('error getting quotes');
    }

    final json = jsonDecode(response.body);

    return User.fromJson(json);

  }

  Future<User> addCustomer(AddCustomerRequest request) async {

    final url = '$baseUrl/account';

    final response = await this.httpClient.post(url, body:jsonEncode(request.toJson()));

    if (response.statusCode != 200) {
      throw new Exception('error getting quotes');
    }

    final json = jsonDecode(response.body);

    return User.fromJson(json);

  }

}