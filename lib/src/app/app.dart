import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:game_on/src/features/players/presentation/cubit/fetch_players_team_cubit/fetch_players_team_cubit.dart';
import 'package:game_on/src/features/teams/presentation/cubit/get_one_team_cubit/get_one_team_cubit.dart';
import 'package:game_on/src/features/teams/presentation/cubit/starting_lineup_player_cubit/starting_lineup_player_cubit.dart';
import 'package:get/get.dart';

import '../config/routes/app_pages.dart';
import '../config/themes/app_theme.dart';
import '../features/auth/presentation/cubit/auth_cubit.dart';
import '../features/squads/presentation/cubit/squad_cubit.dart';
import '../features/teams/presentation/cubit/action_team_squad_cubit/action_team_squad_cubit.dart';
import '../features/teams/presentation/cubit/get_team_equipament_cubit/get_team_equipament_cubit.dart';
import '../features/teams/presentation/cubit/team_action_cubit/team_action_cubit.dart';
import '../features/teams/presentation/cubit/team_fetch_cubit/team_fetch_cubit.dart';
import '../features/trophies/presentation/cubit/fetch_trophies_team_cubit/fetch_trophies_team_cubit.dart';
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
        BlocProvider(create: (context) => di.sl<FetchTrophiesTeamCubit>()),
        BlocProvider(create: (context) => di.sl<GetTeamEquipamentCubit>()),
        BlocProvider(create: (context) => di.sl<SquadCubit>()),
        BlocProvider(create: (context) => di.sl<StartingLineupPlayerCubit>()),
        BlocProvider(create: (context) => di.sl<ActionTeamSquadCubit>()),
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
