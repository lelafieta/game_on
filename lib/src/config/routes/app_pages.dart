import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import '../../features/game_on/presentation/game_on_page.dart';
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
