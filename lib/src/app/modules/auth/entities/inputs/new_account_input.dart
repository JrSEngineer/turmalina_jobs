// ignore_for_file: public_member_api_docs, sort_constructors_first
class NewAccountInput {
  String email;
  String password;
  String confirmationPassword;

  NewAccountInput({
    required this.email,
    required this.password,
    required this.confirmationPassword,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }
}
