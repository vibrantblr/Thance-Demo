import 'package:ThanceDemo/core/dimens/dimens.dart';
import 'package:ThanceDemo/core/dimens/sizedbox.dart';
import 'package:ThanceDemo/core/styles/app_colors.dart';
import 'package:ThanceDemo/core/styles/app_text.dart';
import 'package:ThanceDemo/core/styles/app_text_styles.dart';
import 'package:ThanceDemo/resource/generated/assets.gen.dart';
import 'package:ThanceDemo/screen/home_screen/home_screen.dart';
import 'package:ThanceDemo/screen/name_entry_screen/bloc/name_entry_bloc.dart';
import 'package:ThanceDemo/src/generated/l10n.dart';
import 'package:ThanceDemo/widgets/custom_app_bar/custom_app_bar_widget.dart';
import 'package:ThanceDemo/widgets/custom_textfield/custom_textfield_widget.dart';
import 'package:ThanceDemo/widgets/custom_toast_message/custom_toast_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_app_button/custom_app_button_widget.dart';

final TextEditingController _nameController = TextEditingController();

class NameEntryScreen extends StatelessWidget {
  const NameEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameEntryBloc = BlocProvider.of<NameEntryBloc>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppbarWidget(
        appBarText: Lang.current.nameentry,
        color: AppColors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimens.d16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildnameEntryvector(),
            buildsizedboxH(Dimens.d100),
            _buildfullname(),
            buildsizedboxH(Dimens.d16),
            _buildAppbutton(
              context,
              nameEntryBloc,
            )
          ],
        ),
      ),
    );
  }

  _buildnameEntryvector() {
    return Padding(
      padding: EdgeInsets.only(top: Dimens.d150.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Assets.images.png.flutterBlocLogo.image(height: 50.h)],
      ),
    );
  }

  _buildAppbutton(
    BuildContext context,
    NameEntryBloc nameEntryBloc,
  ) {
    return AppButton(
      buttonText: Lang.of(context).continueText,
      onpressed: () {
        final String name = _nameController.text.trim();
        if (name.isNotEmpty) {
          nameEntryBloc.add(SaveNameEvent(name: name));
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return const HomeScreen();
            },
          ));
        } else {
          // Show a snackbar or dialog to prompt the user to enter their name
          toastMessageWidget(context, Lang.current.enterName, false);
        }
      },
    );
  }

  _buildfullname() {
    return Column(
      children: [
        _buildFieldTitle(Lang.current.fullname),
        buildsizedboxH(Dimens.d8),
        AppTextFormField(
            label: Lang.current.fullname, controller: _nameController),
      ],
    );
  }

  Row _buildFieldTitle(String title) {
    return Row(
      children: [
        AppText(text: title, textStyle: AppTextStyles.size16WithMedium),
      ],
    );
  }
}
