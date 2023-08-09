import 'dart:async';
import 'package:ThanceDemo/core/dimens/dimens.dart';
import 'package:ThanceDemo/resource/generated/assets.gen.dart';
import 'package:ThanceDemo/screen/home_screen/home_screen.dart';
import 'package:ThanceDemo/screen/sign_up_screen/sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeFirebaseAndNavigate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(Dimens.d16),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_buildSplashlogo()]),
      ),
    );
  }

  _buildSplashlogo() {
    return Container(
      height: Dimens.d170.h,
      width: Dimens.d400.w,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: Assets.images.png.flutterBlocLogo.provider(),
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high)),
    );
  }

  final auth = FirebaseAuth.instance;

  ///this [_initializeFirebaseAndNavigate]  Method to delay the transition to the Sign-Up Screen when user is not register if user is register then Navigate to home screen
  Future<void> _initializeFirebaseAndNavigate() async {
    // Check authentication status here
    final isUserAuthenticated = auth.currentUser != null;
    Future.delayed(const Duration(seconds: 2), () {
      if (isUserAuthenticated) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SignUpScreen()),
        );
      }
    });
  }
}
