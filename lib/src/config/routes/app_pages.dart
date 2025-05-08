import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:game_on/src/features/auth/presentation/pages/login_page.dart';
import 'package:game_on/src/features/competitions/presentation/pages/my_competion_details_page.dart';
import 'package:game_on/src/features/competitions/presentation/pages/create_competition_page.dart';
import 'package:game_on/src/features/competitions/presentation/pages/my_competition_details_page.dart';
import 'package:game_on/src/features/competitions/presentation/pages/list_my_competitions_page.dart';
import 'package:game_on/src/features/game_on/presentation/game_on_page.dart';
import 'package:game_on/src/features/live_games/presentation/pages/live_game_page.dart';
import 'package:game_on/src/features/organizers/presentation/pages/organizer_details_page.dart';
import 'package:game_on/src/features/organizers/presentation/pages/organizer_page.dart';
import 'package:game_on/src/features/splash&onboarding/presentation/pages/splash_page.dart';
import 'package:game_on/src/features/teams/presentation/pages/list_my_teams.dart';
import '../../features/organizers/presentation/pages/organizer_home_page.dart';
import '../../features/teams/presentation/pages/create_team_page.dart';
import 'app_routes.dart';

class AppPages {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.initial:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const SplashPage();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
              child: child,
            );
          },
        );
      case AppRoutes.gameOn:
        final params = settings.arguments as int;
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return GameOnPage(
              index: params,
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
              child: child,
            );
          },
        );

      case AppRoutes.organizerDetails:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const OrganizerDetailsPage();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.vertical,
              child: child,
            );
          },
        );
      case AppRoutes.competionDetails:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return CompetitionDetailsPage();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.vertical,
              child: child,
            );
          },
        );

      case AppRoutes.liveGames:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const LiveGamePage();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.vertical,
              child: child,
            );
          },
        );

      case AppRoutes.listMyCompetitions:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const ListMyCompetitionsPage();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.vertical,
              child: child,
            );
          },
        );
      case AppRoutes.myCompetitionDetails:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const MyCompetitionDetailsPage();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.vertical,
              child: child,
            );
          },
        );

      case AppRoutes.createCompetition:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return CreateCompetitionPage();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.vertical,
              child: child,
            );
          },
        );

      case AppRoutes.login:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const LoginPage();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.vertical,
              child: child,
            );
          },
        );

      case AppRoutes.organizer:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const OrganizerPage();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.vertical,
              child: child,
            );
          },
        );

      case AppRoutes.organizerHome:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const OrganizerHomePage();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.vertical,
              child: child,
            );
          },
        );

      case AppRoutes.listMyTeams:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const ListMyTeamsPage();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.vertical,
              child: child,
            );
          },
        );
      case AppRoutes.createTeam:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const CreateTeamPage();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.vertical,
              child: child,
            );
          },
        );

      default:
        return MaterialPageRoute(builder: (_) => const UnknownPage());
    }
  }
}

class UnknownPage extends StatelessWidget {
  const UnknownPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Unknown Page'),
      ),
    );
  }
}
