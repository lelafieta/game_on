import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../config/routes/app_pages.dart';
import '../config/themes/app_theme.dart';
import '../features/auth/presentation/cubit/auth_cubit.dart';
import '../features/teams/presentation/cubit/team_action_cubit.dart';
import 'di.dart' as di;

class GameOnApp extends StatelessWidget {
  const GameOnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<AuthCubit>()),
        BlocProvider(create: (context) => di.sl<TeamActionCubit>()),
      ],
      child: GetMaterialApp(
        title: 'GameOn',
        darkTheme: AppTheme.lightTheme,
        theme: AppTheme.lightTheme,
        onGenerateRoute: AppPages.generateRoute,
        builder: EasyLoading.init(),
      ),
    );
  }
}
