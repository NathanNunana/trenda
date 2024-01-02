const _emailRegX = r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$";
const _passwordRedX = r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$";
const _phoneRegX = r"^\+?[0-9]+$";

class Validators {
  static String? defaultValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Required";
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    if (!RegExp(_emailRegX).hasMatch(value)) {
      return "Invalid email address";
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    if (!RegExp(_passwordRedX).hasMatch(value)) {
      return "Password must be at least 8 characters long and include both letters and numbers";
    }
    return null;
  }

  static String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number is required";
    }
    if (!RegExp(_phoneRegX).hasMatch(value)) {
      return "Invalid phone number";
    }
    return null;
  }
}
