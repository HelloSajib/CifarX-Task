enum ValidationType { name, phone, email, password, otp, required }

class FormValidation {

  final ValidationType validationType;
  final String? formValue;
  FormValidation({required this.validationType, required this.formValue});

  String? validate() {
    switch (validationType) {
        case ValidationType.name:
          return userNameValidation(name: formValue);

        case ValidationType.phone:
          return phoneValidation(phone: formValue);

        case ValidationType.email:
          return emailValidation(email: formValue);

        case ValidationType.password:
          return passwordValidation(password: formValue);

        case ValidationType.otp:
          return otpValidation(code: formValue);

      case ValidationType.required:
          return requiredField(value: formValue);

    }
  }

  String? requiredField({required String? value}) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    } else {
      return null;
    }
  }

  String? userNameValidation({required String? name}) {
    if (name == null || name.isEmpty) {
      return "This field is required";
    } else {
      return null;
    }
  }

  String? phoneValidation({required String? phone}) {
    if (phone == null || phone.isEmpty) {
      return "Phone number is required";
    }

    if(!phone.startsWith("01")){
      return "Please starts with 01xxxxxxxxx";
    }

    // Must start with 01 and be exactly 11 digits (01XXXXXXXXX)
    final pattern = RegExp(r'^01[3-9]\d{8}$');

    if (!pattern.hasMatch(phone)) {
      return "Enter a valid phone number";
    }

    return null; // Valid number
  }


  String? emailValidation({required String? email}) {
    if (email != null) {
      final bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
      return emailValid ? null : "Enter your valid email";
    } else {
      return null;
    }
  }

  String? passwordValidation({required String? password}) {
    return password != null && password.length > 5
        ? null
        : "Enter minimum 6 digit password";
  }

  String? otpValidation({required String? code}) {
    return code != null && code.length >= 5
        ? null
        : "6 Digit number is required.";
  }

}