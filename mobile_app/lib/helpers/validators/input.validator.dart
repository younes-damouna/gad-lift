import 'dart:developer';

class Validator {
  static validateName(String value) {
    log('HelloWorld from  $value');
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return "Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    } else if (value.length < 6) {
      return "Name must 6 characters long";
    } else {
      return null;
    }
  }

 
}
