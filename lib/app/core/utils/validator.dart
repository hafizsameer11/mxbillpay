import '../../export.dart';

class Validator {
  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return strEmailNotEmpty;
    } else if (!GetUtils.isEmail(value.trim())) {
      return strInvalidEmail;
    }
    return null;
  }

  static String? validateAddress(String value) {
    if (value.isEmpty) {
      return strAddressIsEmpty;
    }
    return null;
  }

  static String? validateField(String value, String hint) {
    if (value.isEmpty) {
      return hint + " " + strValidationEmpty;
    }
    return null;
  }

  static String? firstName(String value) {
    if (value.isEmpty) {
      return strFirstNameIsNotEmpty;
    } else {
      return null;
    }
    // } else if (value==null) {
    //   return strFirstNameIsNotEmpty;
    // }
  }

  static String? cardName(String value) {
    if (value.isEmpty) {
      return strFirstNameIsNotEmpty;
    } else {
      return null;
    }
  }

  static String? lastName(String value) {
    if (value.isEmpty) {
      return strLastNameIsNotEmpty;
    } else {
      return null;
    }
    // } else if (value == null) {
    //   return strLastNameIsNotEmpty;
    // }
  }

  static bool validateNumber(String value) {
    var pattern = r'^[0-9]+$';

    RegExp regex = RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return strPasswordEmpty;
    } else if (value.length < 8) {
      return strInvalidPassword;
    }
    return null;
  }

  static String? validatePasswordS(String value) {
    if (value.isEmpty) {
      return strPasswordEmpty;
    } else if (value.length < 8) {
      return strInvalidPassword;
    }
    return null;
  }

  static String? validateConfirmPasswordMatch(
      {String? value, String? password}) {
    if (value!.isEmpty) {
      return strCPasswordEmpty;
    } else if (value.length < 8) {
      return strInvalidPassword;
    } else if (value != password) {
      return strPasswordMatch;
    }
    return null;
  }
  /*================================================== Phone Number Validator ===================================================*/
}
