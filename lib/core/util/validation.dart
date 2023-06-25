String? passwordValidator({String? value, int minimumLength = 6}) {
  if (value == "") {
    return "password field cannot be empty";
  } else if (value != null && value.length < minimumLength) {
    return "Password should have min $minimumLength characters";
  }
  // else if (value != null &&
  //     !value.contains(RegExp(
  //         r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%&\><*~])'))) {
  //   return "Password should be alphanumeric and contain at least 1 uppercase, 1 lowercase and one of !@#\$%&";
  // }
  return null;
}

String? otpValidator({String? value, int minimumLength = 8}) {
  if (value == "") {
    return "Otp field cannot be empty";
  } else if (value != null && value.length < minimumLength) {
    return "Otp should have min $minimumLength characters";
  }
  // else if (value != null &&
  //     !value.contains(RegExp(
  //         r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%&\><*~])'))) {
  //   return "Password should be alphanumeric and contain at least 1 uppercase, 1 lowercase and one of !@#\$%&";
  // }
  return null;
}

String? usernameValidator(String? value) {
  if (value == "") {
    return "Username field cannot be empty";
  }

  if(value!.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))){
    return "Username should not include special characters i.e /@!#\$%";
  }

  return null;
}


String? confirmPasswordValidator({String? value, String? newPasswordValue, int minimumLength = 6}) {
  if (value == "") {
    return null;
  } else if (value != null && value.length < minimumLength) {
    return "Password should have min $minimumLength characters";
  } else if (value != null && newPasswordValue != value) {
    return "Passwords did not match";
  }
  return null;
}

String? emailValidator(String? value) {
  if (value == "") {
    return "Email field cannot be empty";
  }
  const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  final regex = RegExp(pattern);

  return value!.isNotEmpty && !regex.hasMatch(value) ? 'Email is incorrect' : null;
}

