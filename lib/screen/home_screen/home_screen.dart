import 'package:ThanceDemo/core/dimens/dimens.dart';
import 'package:ThanceDemo/core/dimens/sizedbox.dart';
import 'package:ThanceDemo/core/styles/app_colors.dart';
import 'package:ThanceDemo/core/styles/app_text.dart';
import 'package:ThanceDemo/core/styles/app_text_styles.dart';
import 'package:ThanceDemo/screen/home_screen/bloc/home_bloc.dart';
import 'package:ThanceDemo/screen/sign_up_screen/sign_up_screen.dart';
import 'package:ThanceDemo/widgets/custom_app_bar/custom_app_bar_widget.dart';
import 'package:ThanceDemo/widgets/custom_app_button/custom_app_button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    homeBloc.add(
        LoadHomeDataEvent()); // Load home data when the screen is initialized
    return Scaffold(
      appBar: const AppbarWidget(
        appBarText: 'Home',
        color: AppColors.black,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoaded) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimens.d16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                        text: 'Welcome, ${state.name} !',
                        textStyle: AppTextStyles.size18WithBold),
                    buildsizedboxH(Dimens.d16),
                    AppButton(
                        buttonText: 'logout',
                        onpressed: () {
                          FirebaseAuth.instance.signOut();
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return const SignUpScreen();
                            },
                          ));
                        })
                  ],
                ),
              ),
            );
          } else if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeError) {
            return Center(child: Text('Error: ${state.error}'));
          } else {
            return const Center(child: Text('Unknown state.'));
          }
        },
      ),
    );
  }
}
