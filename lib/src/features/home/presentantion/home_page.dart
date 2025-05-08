import 'package:flutter/material.dart';
import 'package:game_on/src/features/competitions/presentation/pages/my_competition_details_page.dart';
import 'package:game_on/src/features/competitions/presentation/pages/list_my_competitions_page.dart';
import 'package:game_on/src/features/teams/presentation/pages/list_my_teams.dart';
import 'package:game_on/src/features/teams/presentation/pages/team_deatils_page.dart';

class HomePage extends StatefulWidget {
  final int? index;
  const HomePage({super.key, this.index});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget content;

    switch (widget.index) {
      case 0:
        content = const MyCompetitionDetailsPage();
        break;
      case 1:
        content = const TeamDetailsPage();
        break;
      case 2:
        content = const Center(child: Text('Tela 2'));
        break;
      default:
        content = const Center(child: Text('Tela padrão'));
    }

    return Scaffold(
      body: content,
    );
  }
}
