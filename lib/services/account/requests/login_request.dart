class LoginRequest {

  final String username;
  final String password;

  LoginRequest(this.username, this.password);

  Map toJson() => {
    'username': username,
    'password': password,
  };

}