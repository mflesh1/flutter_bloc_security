class CreateRequest {

  final String name;
  final String email;
  final String password;
  final bool pushEnabled;
  final bool emailEnabled;

  CreateRequest(this.name, this.email, this.password, this.pushEnabled, this.emailEnabled);

  Map toJson() => {
    'name': name,
    'email': email,
    'password': password,
    'pushEnabled': pushEnabled,
    'emailEnabled': emailEnabled,
  };

}