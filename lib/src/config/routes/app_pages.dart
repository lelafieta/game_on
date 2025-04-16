import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:game_on/src/features/competitions/presentation/pages/competion_details_page.dart';
import 'package:game_on/src/features/competitions/presentation/pages/my_competition_details_page.dart';
import 'package:game_on/src/features/competitions/presentation/pages/my_competitions_list_page.dart';
import 'package:game_on/src/features/game_on/presentation/game_on_page.dart';
import 'package:game_on/src/features/live_games/presentation/pages/live_game_page.dart';
import 'package:game_on/src/features/organizers/presentation/pages/organizer_details_page.dart';
import 'app_routes.dart';

class AppPages {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.gameOn:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const GameOnPage();
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
            return const CompetitionDetailsPage();
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

      case AppRoutes.myCompetitionsList:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const MyCompetitionsListPage();
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
      case AppRoutes.myCompetitionsDetails:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const MyCompetitionsDetailsPage();
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
