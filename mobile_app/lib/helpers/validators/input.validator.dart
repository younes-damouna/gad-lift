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

  static validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return "Email is required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }


    static  validatePassword(String value) {
    if (value.length < 8) {
      return "Password must be at least 8 characters";
    }
    return null;
  }

   static  validateIP(String value) {
    String pattern = r'^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return "IP Address is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Format should look like 192.168.0.200";
    }
    return null;
  }
}
