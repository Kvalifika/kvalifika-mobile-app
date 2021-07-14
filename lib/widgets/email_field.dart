import 'package:flutter/material.dart';
import 'package:kvalifika_demo/colors.dart';
import 'package:kvalifika_demo/validator.dart';

class EmailField extends StatelessWidget {
  final Function(String value) onChanged;
  const EmailField({Key? key, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: kTextColor),
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Email Address',
        hintStyle: TextStyle(color: kPrimaryColor, fontSize: 16),
        errorStyle: TextStyle(
          fontSize: 14,
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: kErrorColor),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor),
        ),
      ),
      validator: (value) {
        if (Validator.isValidEmail(value)) return null;
        return 'Please enter a valid email';
      },
      keyboardType: TextInputType.emailAddress,
      onChanged: onChanged,
    );
  }
}
