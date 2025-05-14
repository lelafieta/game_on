import 'package:flutter/material.dart';

class AdeptPage extends StatefulWidget {
  const AdeptPage({super.key});

  @override
  State<AdeptPage> createState() => _AdeptPageState();
}

class _AdeptPageState extends State<AdeptPage> with TickerProviderStateMixin {
  late TabController _tabController;

  final List<Tab> myTabs = const [
    Tab(icon: Icon(Icons.home), text: 'Início'),
    Tab(icon: Icon(Icons.person), text: 'Perfil'),
    Tab(icon: Icon(Icons.lightbulb), text: 'Palpites'),
    Tab(icon: Icon(Icons.calendar_today), text: 'Jogos'),
    Tab(icon: Icon(Icons.forum), text: 'Fórum'),
    Tab(icon: Icon(Icons.emoji_events), text: 'Conquistas'),
    Tab(icon: Icon(Icons.leaderboard), text: 'Rankings'),
    Tab(icon: Icon(Icons.settings), text: 'Configurações'),
    Tab(icon: Icon(Icons.support_agent), text: 'Suporte'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: myTabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adepto'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: myTabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(child: Text('Início')), // Feed de notícias
          Center(child: Text('Perfil')), // Dados pessoais e histórico
          Center(child: Text('Palpites')), // Meus palpites
          Center(child: Text('Jogos')), // Jogos próximos
          Center(child: Text('Fórum')), // Comunidade
          Center(child: Text('Conquistas')), // Minhas conquistas
          Center(child: Text('Rankings')), // Rankings
          Center(child: Text('Configurações')), // Ajustes do app
          Center(child: Text('Suporte')), // Suporte e contato
        ],
      ),
    );
  }
}
