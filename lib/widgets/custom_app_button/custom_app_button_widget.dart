
import 'package:ThanceDemo/core/dimens/dimens.dart';
import 'package:ThanceDemo/core/styles/app_colors.dart';
import 'package:ThanceDemo/core/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/styles/app_text_styles.dart';

class AppButton extends StatelessWidget {
  final String buttonText;
  final double? width;
  final Function onpressed;

  const AppButton({
    super.key,
    required this.buttonText,
    this.width,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onpressed();
      },
      child: Container(
        height: Dimens.d60.h,
        width: width,
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: AppText(
            text: buttonText,
            textStyle: AppTextStyles.size20WithMedium
                .copyWith(color: AppColors.whitecolor),
          ),
        ),
      ),
    );
  }
}
