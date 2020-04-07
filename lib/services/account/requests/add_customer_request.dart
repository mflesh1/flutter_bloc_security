class AddCustomerRequest {

  final String accessCode;

  AddCustomerRequest(this.accessCode);

  Map toJson() => {
    'accessCode': accessCode
  };

}