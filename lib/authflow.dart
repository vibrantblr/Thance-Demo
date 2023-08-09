import 'package:ThanceDemo/repo/authentication_repo.dart';
import 'package:ThanceDemo/screen/home_screen/bloc/home_bloc.dart';
import 'package:ThanceDemo/screen/name_entry_screen/bloc/name_entry_bloc.dart';
import 'package:ThanceDemo/screen/sign_up_screen/bloc/sing_up_bloc.dart';
import 'package:ThanceDemo/screen/splash_screen/splash_screen.dart';
import 'package:ThanceDemo/src/generated/l10n.dart';
import 'package:ThanceDemo/utils/common_validation/bloc/validation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthflowApp extends StatelessWidget {
  final UserRepository userRepository;
  const AuthflowApp({super.key, required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SingUpBloc>(create: (context) => SingUpBloc()),
        BlocProvider<NameEntryBloc>(
            create: (context) => NameEntryBloc(userRepository: userRepository)),
        BlocProvider<HomeBloc>(
            create: (context) => HomeBloc(userRepository: userRepository)),
        BlocProvider<ValidationBloc>(create: (context) => ValidationBloc()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            supportedLocales: Lang.delegate.supportedLocales,
            localizationsDelegates: const [
              Lang.delegate,
            ],
            title: 'Authentication_fkow',
            theme: ThemeData.light(),
            home: const SplashScreen()),
      ),
    );
  }
}
