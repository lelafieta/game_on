import 'package:flutter/material.dart';

class MyCompetitionsListPage extends StatelessWidget {
  const MyCompetitionsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Competitions'),
      ),
      body: const Center(
        child: Text('List of Competitions will be displayed here'),
      ),
    );
  }
}
