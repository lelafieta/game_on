import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:game_on/src/features/players/presentation/cubit/fetch_players_team_cubit/fetch_players_team_cubit.dart';
import 'package:game_on/src/features/teams/presentation/cubit/get_one_team_cubit/get_one_team_cubit.dart';
import 'package:get/get.dart';

import '../config/routes/app_pages.dart';
import '../config/themes/app_theme.dart';
import '../features/auth/presentation/cubit/auth_cubit.dart';
import '../features/teams/presentation/cubit/team_action_cubit/team_action_cubit.dart';
import '../features/teams/presentation/cubit/team_fetch_cubit/team_fetch_cubit.dart';
import 'di.dart' as di;

class GameOnApp extends StatelessWidget {
  const GameOnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<AuthCubit>()),
        BlocProvider(create: (context) => di.sl<TeamActionCubit>()),
        BlocProvider(
            create: (context) => di.sl<TeamFetchCubit>()..getMyTeams()),
        BlocProvider(create: (context) => di.sl<GetOneTeamCubit>()),
        BlocProvider(create: (context) => di.sl<FetchPlayersTeamCubit>()),
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
