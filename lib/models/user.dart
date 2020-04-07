import 'package:equatable/equatable.dart';

class User extends Equatable {

  final String name;
  final String token;

  const User({this.name, this.token});

  @override
  List<Object> get props => [name, token];

  static User fromJson(dynamic json) {

    return User(
      name: json['name'],
      token: json['token'],
    );

  }

  Map toJson() {
    return {
      'name': name,
      'token': token,
    };
  }

  @override
  String toString() => 'User { name: $name }';

}