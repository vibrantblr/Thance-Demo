import 'package:ThanceDemo/core/dimens/dimens.dart';
import 'package:ThanceDemo/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

toastMessageWidget(BuildContext context, String message, bool? success) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: const Duration(seconds: 1),
    margin: const EdgeInsets.all(Dimens.d16),
    shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimens.d8)),
    behavior: SnackBarBehavior.floating,
    content: Text(message),
    backgroundColor:
        success ?? false ? AppColors.textcolorgreen : AppColors.errorcolor,
  ));
}
