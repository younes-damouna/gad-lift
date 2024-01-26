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

  static validatePassword(String value) {
    if (value.length < 8) {
      return "Password must be at least 8 characters";
    }
    return null;
  }

  static validateIP(String value) {
    String pattern =
        r'^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return "IP Address is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Format should look like 192.168.0.200";
    }
    return null;
  }

  static validateFullName(String value) {
    if (value.isEmpty) {
      return "Full Name is Required";
    }
    List<String> nameParts = value.trim().split(' ');
    if (nameParts.length < 2) {
      return "Full Name must be at least two words";
    }
    for (String part in nameParts) {
      if (part.length < 2 || !RegExp(r'^[a-zA-Z]+$').hasMatch(part)) {
        return "Each word must be at least 2 characters long";
      }
    }
    return null;
  }




   static  validatePhoneNumber(String value) {
    String pattern = r'^\d{8}$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return "Phone number is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Phone number must be exactly 8 digits";
    }
    return null;
  }

   static  validateFamilyCode(String value) {
    String pattern = r'^\d{6}$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return "Family code is required";
    } else if (!regExp.hasMatch(value)) {
      return "Family code must be exactly 6 digits";
    }
    return null;
  }


   static  validateFloor(String value) {
    int? floorNumber = int.tryParse(value);
    if (floorNumber == null) {
      return "Floor must be a number";
    } else if (floorNumber < 1 || floorNumber > 6) {
      return "Floor must be a number between 1 and 6";
    }
    return null;
  }
}
