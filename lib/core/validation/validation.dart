class ValidateFunctions {
  String? validationOfFullName(String? inputText) {
    if (inputText?.trim().isEmpty == true || inputText == null) {
      return 'يرجى إدخال اسمك.';
    }
    return null;
  }

  String? validationOfUserName(String? inputText) {
    if (inputText?.trim().isEmpty == true || inputText == null) {
      return 'يرجى إدخال اسم المستخدم.';
    }
    if (inputText.length < 3 || inputText.length > 16) {
      return 'يجب أن يكون اسم المستخدم بين 3 و16 حرفًا.';
    }

    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(inputText)) {
      return 'يمكن أن يحتوي اسم المستخدم على أحرف وأرقام وشرطات سفلية فقط.';
    }
    return null;
  }

  String? validationOfFirstOrLastName(
    String? inputText, {
    bool isFirstName = true,
  }) {
    RegExp nameRegExp = RegExp(r'^[A-Za-z]+$');

    if (inputText?.trim().isEmpty == true || inputText == null) {
      return isFirstName
          ? 'يرجى إدخال الاسم الأول.'
          : 'يرجى إدخال اسم العائلة.';
    }
    if (inputText.trim().length < 3) {
      return 'يمكن أن يحتوي اسم المستخدم على أحرف وأرقام وشرطات سفلية فقط.';
    }
    if (!nameRegExp.hasMatch(inputText)) {
      return 'يمكن أن تحتوي الأسماء على أحرف أبجدية فقط.';
    }
    return null;
  }

  String? validationOfAddress(String? inputText) {
    final RegExp addressRegex = RegExp(r"^[\p{L}\d\s,.\-\/#]+$", unicode: true);

    if (inputText == null || inputText.trim().isEmpty) {
      return 'يرجى إدخال العنوان';
    }

    if (!addressRegex.hasMatch(inputText.trim())) {
      return 'يرجى إدخال عنوان صالح';
    }

    return null;
  }

  String? validationOfRecipient(String? inputText) {
    final RegExp addressRegex = RegExp(r"^[\p{L}\d\s,.\-\/#]+$", unicode: true);

    if (inputText == null || inputText.trim().isEmpty) {
      return 'يرجى إدخال مستلم صالح';
    }

    if (!addressRegex.hasMatch(inputText.trim())) {
      return 'يرجى إدخال مستلم صالح';
    }

    return null;
  }

  String? validationOfEmail(String? inputText) {
    RegExp gmailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (inputText?.trim().isEmpty == true || inputText == null) {
      return 'أدخل بريدك الإلكتروني.';
    }
    if (!gmailRegExp.hasMatch(inputText)) {
      return 'أدخل بريدك الإلكتروني.';
    }
    return null;
  }

  String? validationOfPhoneNumber(String? inputText) {
    RegExp phoneNumber = RegExp(r'^(\+2)?(010|011|012|015)[0-9]{8}$');
    if (inputText?.trim().isEmpty == true || inputText == null) {
      return 'يرجى إدخال رقم هاتفك.';
    } else if (!phoneNumber.hasMatch(inputText)) {
      return '"يجب أن يبدأ الرقم بأحد البادئات التالية:\n010، 011، 012، أو 015\nويتبعها 8 أرقام.';
    }
    return null;
  }

  String? validationOfPassword(String? inputText) {
    // RegExp passValid = RegExp(
    //     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@\$%^&*-]).{8,}\$');
    if (inputText?.trim().isEmpty == true || inputText == null) {
      return 'يرجى إدخال كلمة المرور.';
    } else if (inputText.length < 8) {
      return 'يجب أن تكون كلمة المرور مكونة من 8 أحرف على الأقل.';
    } else if (!RegExp(r'(?=.*?[A-Z])').hasMatch(inputText)) {
      return 'حرف كبير واحد على الأقل.';
    } else if (!RegExp(r'(?=.*?[a-z])').hasMatch(inputText)) {
      return 'حرف صغير واحد على الأقل.';
    } else if (!RegExp(r'(?=.*?[0-9])').hasMatch(inputText)) {
      return 'يجب أن تحتوي على رقم واحد على الأقل.';
    } else if (!RegExp(r'(?=.*?[#?!@$%^&*-])').hasMatch(inputText)) {
      return 'يجب تضمين رمز خاص واحد على الأقل (مثال: #?!@\$%^&*-).';
    }
    return null;
  }

  String? validationOfConfirmPassword(
    String? inputText,
    String passwordToMatchWith,
  ) {
    if (inputText?.trim().isEmpty == true || inputText == null) {
      return 'يرجى تأكيد كلمة المرور.';
    } else if (inputText != passwordToMatchWith) {
      return 'غير متطابق!';
    }
    return null;
  }
}
