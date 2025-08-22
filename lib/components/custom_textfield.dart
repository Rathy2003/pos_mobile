import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning/helper/custom_textfield_validation_rule.dart';
import 'package:learning/helper/style.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.isObscureTextField,
    this.placeholder,
    this.controller,
    this.suffixIcon,
    this.rule,
    this.validator,
    this.isShowPassword = false,
    this.errorText
  });

  final bool? isObscureTextField;
  final String? placeholder;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final CustomtextFieldValidationRule? rule;
  final String? Function(String?)? validator;
  bool isShowPassword = false;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        obscureText: isObscureTextField ?? false,
        keyboardType: _getKeyboardType(),
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          errorText:  errorText,
          contentPadding: EdgeInsets.symmetric(vertical: 20,horizontal: 15),
          hintText: placeholder,
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: StyleColor.filledBackground,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.red
            )
          ),
          errorStyle: TextStyle(
            fontSize: 17,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.blueAccent
            )
          ),
        ),
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 18,
          ),
        )
      );
  }

  TextInputType _getKeyboardType() {
    switch (rule){
      case CustomtextFieldValidationRule.decimalNumber:
        return TextInputType.numberWithOptions(decimal: true);
      case CustomtextFieldValidationRule.digitNumber:
        return TextInputType.number;
      case CustomtextFieldValidationRule.phone:
        return TextInputType.phone;
      case CustomtextFieldValidationRule.email:
        return TextInputType.emailAddress;
      case CustomtextFieldValidationRule.password:
        return TextInputType.visiblePassword;
      default:
        return TextInputType.text;
    }
  }
}