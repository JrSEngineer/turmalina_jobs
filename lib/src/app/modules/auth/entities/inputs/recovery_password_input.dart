// ignore_for_file: public_member_api_docs, sort_constructors_first
class RecoveryPasswordInput {
  String email;
  String verificationCode;
  String confirmationPassword;
  
  RecoveryPasswordInput({
    required this.email,
    required this.verificationCode,
    required this.confirmationPassword,
  });
}
