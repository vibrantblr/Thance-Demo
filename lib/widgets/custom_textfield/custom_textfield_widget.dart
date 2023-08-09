// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:ThanceDemo/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/dimens/dimens.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField(
      {Key? key,
      this.validator,
      this.isObscure = false,
      this.isCapitalized = false,
      this.maxLines = 1,
      this.isLabelEnabled = true,
      this.readOnly = false,
      this.controller,
      this.inputAction,
      this.focusNode,
      required this.label,
      this.hint = "",
      this.onTap,
      this.prefix,
      this.maxLength,
      this.suffixIcon,
      this.keyboardtype,
      this.autofillHints,
      this.inputFormatters,
      this.prefixIcon,
      this.obscureText = false,
      this.onFieldSubmitted,
      this.fillcolor,
      this.onChanged,
      this.autovalidateMode,
      this.autocorrect=true})
      : super(key: key);
  final TextEditingController? controller;
  final TextInputAction? inputAction;
  final String label;
  final String hint;
  final bool isObscure;
  final bool isCapitalized;
  final int maxLines;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final bool isLabelEnabled;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;
  final bool readOnly;
  final Color? fillcolor;
  final Widget? suffixIcon;
  final keyboardtype;
  final AutovalidateMode? autovalidateMode;

  final Widget? prefix;
  final Widget? prefixIcon;
  final bool autofocus = false;
  final onTap;
  final autofillHints;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final bool autocorrect;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        autovalidateMode:autovalidateMode ,
        autocorrect: autocorrect,
        onChanged: onChanged,
        obscureText: obscureText,
        inputFormatters: inputFormatters,
        autofillHints: autofillHints,
        cursorColor: AppColors.black,
        onTap: onTap,
        maxLines: maxLines,
        maxLength: maxLength,
        onFieldSubmitted: onFieldSubmitted,
        focusNode: focusNode,
        controller: controller,
        readOnly: readOnly,
        autofocus: false,
        keyboardType: keyboardtype,
        textInputAction: TextInputAction.done,
        textCapitalization:
            isCapitalized ? TextCapitalization.words : TextCapitalization.none,
        style: const TextStyle(
          color: AppColors.black,
        ),
        validator: validator,
        decoration: InputDecoration(
            hintText: hint,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintStyle: GoogleFonts.montserrat(
                fontSize: Dimens.d16.sp,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                color: AppColors.grey),
            counterText: '',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.d10.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.d10.r),
            ),
            fillColor: AppColors.whitecolor,
            filled: true),
      ),
    );
  }
}
