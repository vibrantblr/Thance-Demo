import 'package:ThanceDemo/core/dimens/dimens.dart';
import 'package:ThanceDemo/core/dimens/sizedbox.dart';
import 'package:ThanceDemo/core/styles/app_colors.dart';
import 'package:ThanceDemo/core/styles/app_text.dart';
import 'package:ThanceDemo/core/styles/app_text_styles.dart';
import 'package:ThanceDemo/resource/generated/assets.gen.dart';
import 'package:ThanceDemo/screen/home_screen/home_screen.dart';
import 'package:ThanceDemo/screen/name_entry_screen/name_entry_screen.dart';
import 'package:ThanceDemo/screen/sign_up_screen/bloc/sing_up_bloc.dart';
import 'package:ThanceDemo/src/generated/l10n.dart';
import 'package:ThanceDemo/utils/common_validation/bloc/validation_bloc.dart';
import 'package:ThanceDemo/widgets/custom_app_button/custom_app_button_widget.dart';
import 'package:ThanceDemo/widgets/custom_textfield/custom_textfield_widget.dart';
import 'package:ThanceDemo/widgets/custom_toast_message/custom_toast_message_widget.dart';
import 'package:ThanceDemo/widgets/remove_scroll_shadow/remove_scroll_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpBloc = BlocProvider.of<SingUpBloc>(context);

    return Scaffold(
        body: MultiBlocListener(
      listeners: [
        BlocListener<SingUpBloc, SingUpState>(listener: (contextss, state) {
          if (state is SignUpSuccess) {
            Navigator.push(contextss, MaterialPageRoute(
              builder: (contextss) {
                return const NameEntryScreen();
              },
            ));
            toastMessageWidget(contextss, 'User register successfully!', true);
          }
          if (state is UserAlreadyRegisteredState) {
            Navigator.pushReplacement(
                contextss,
                MaterialPageRoute(
                  builder: (contextss) => const HomeScreen(),
                ));
            toastMessageWidget(contextss, 'User login successfully!', true);
          }
          if (state is SignUpFailure) {
            toastMessageWidget(contextss, 'somthing went to wrong!', false);
          }
        }),
      ],
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimens.d16.w),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              _buildsignupvector(),
              buildsizedboxH(Dimens.d100),
              Expanded(
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _buildemail(),
                        buildsizedboxH(Dimens.d16),
                        _buildpassword(),
                        buildsizedboxH(Dimens.d30),
                        _buildsignupbutton(context, signUpBloc, _formkey),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  _buildsignupvector() {
    return Padding(
      padding: EdgeInsets.only(top: Dimens.d150.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Assets.images.png.flutterBlocLogo.image(height: 50.h)],
      ),
    );
  }

  _buildemail() {
    return BlocBuilder<ValidationBloc, ValidationState>(
      builder: (context, state) {
        return Column(
          children: [
            _buildFieldTitle(Lang.current.email),
            buildsizedboxH(Dimens.d8),
            AppTextFormField(
              label: Lang.current.email,
              controller: _emailController,
              inputAction: TextInputAction.next,
              obscureText: false,
              hint: "Example@gmail.com",
              keyboardtype: TextInputType.emailAddress,
              autocorrect: false,
              onChanged: (value) => context
                  .read<ValidationBloc>()
                  .add(ValidationEvent.emailChanged(value)),
              autovalidateMode: state.showErrorMessage == true
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              validator: (_) => state.emailAddress.value.fold<String?>(
                (f) => f.maybeMap<String?>(
                  invalidEmail: (_) => 'Invalid Email',
                  orElse: () => null,
                ),
                (_) => null,
              ),
            ),
          ],
        );
      },
    );
  }

  _buildpassword() {
    return BlocBuilder<ValidationBloc, ValidationState>(
      builder: (context, state) {
        return Column(
          children: [
            _buildFieldTitle(Lang.current.password),
            buildsizedboxH(Dimens.d8),
            AppTextFormField(
              label: Lang.current.password,
              controller: _passwordController,
              inputAction: TextInputAction.done,
              hint: "Enter your password",
              suffixIcon: IconButton(
                onPressed: () => context
                    .read<ValidationBloc>()
                    .add(const ValidationEvent.obscurePasswordToggled()),
                icon: state.obscurePassword
                    ? const Icon(
                        Icons.visibility,
                        color: AppColors.black,
                      )
                    : const Icon(
                        Icons.visibility_off,
                        color: AppColors.black,
                      ),
              ),
              autocorrect: false,
              obscureText: state.obscurePassword,
              onChanged: (value) => context
                  .read<ValidationBloc>()
                  .add(ValidationEvent.passwordChanged(value)),
              validator: (_) => state.password.value.fold<String?>(
                (f) => f.maybeMap<String?>(
                  shortPassword: (_) => 'Short Password',
                  orElse: () => null,
                ),
                (_) => null,
              ),
              autovalidateMode: state.showErrorMessage == true
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
            ),
          ],
        );
      },
    );
  }

  _buildsignupbutton(BuildContext context, SingUpBloc signUpBloc,
      GlobalKey<FormState> formkey) {
    return BlocBuilder<SingUpBloc, SingUpState>(
      builder: (context, state) {
        if (state is SignUpLoading) {
          return Container(
            height: 60.h,
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Center(
                child: CircularProgressIndicator(color: AppColors.whitecolor)),
          );
        }

        return AppButton(
            buttonText: Lang.current.signup,
            onpressed: () async {
              context.read<ValidationBloc>().add(
                    const ValidationEvent.loginSubmitted(),
                  );
              final String email = _emailController.text.trim();
              final String password = _passwordController.text.trim();

              if (_formkey.currentState!.validate()) {
                signUpBloc.add(SignUpWithEmailPasswordEvent(
                    email: email, password: password));

                _emailController.clear();
                _passwordController.clear();
              }
            });
      },
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
