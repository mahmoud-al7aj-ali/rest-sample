class AppValidator {
  static String? requiredValidator(String? value, String? unit) {
    if (value == null || value.isEmpty) {
      return "$unit is required";
    }
    return null;
  }

  static String? emailValidator(String? value) {
    final checkRequired = requiredValidator(value, "Email");
    if (checkRequired != null) return checkRequired;
    final bool emailValid = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?\.[a-zA-Z]{2,}$",
    ).hasMatch(value!);
    if (!emailValid) {
      return "Enter a valid email";
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    final checkRequired = requiredValidator(value, "Password");
    if (checkRequired != null) return checkRequired;
    if (value!.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }
}
