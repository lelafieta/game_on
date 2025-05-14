import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_on/src/features/communities/presentation/pages/community_page.dart';
import 'package:game_on/src/features/followers/presentation/pages/follower_page.dart';

import '../../../../config/themes/app_colors.dart';
import '../../../../core/resources/app_icons.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({super.key});

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> with TickerProviderStateMixin {
  late TabController _tabController;
  int selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: AppColors.primary,
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabAlignment: TabAlignment.center,
              unselectedLabelColor: AppColors.white.withOpacity(.6),
              labelColor: AppColors.white,
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              onTap: (value) {
                setState(() {
                  selectedTabIndex = value;
                });
              },
              tabs: [
                Tab(
                  icon: SvgPicture.asset(
                    AppIcons.football,
                    width: 20,
                    color: selectedTabIndex == 0
                        ? Colors.white
                        : AppColors.white.withOpacity(.6),
                  ),
                  text: 'Perfil',
                ),
                Tab(
                  icon: SvgPicture.asset(
                    AppIcons.settings,
                    color: selectedTabIndex == 1
                        ? Colors.white
                        : AppColors.white.withOpacity(.6),
                  ),
                  text: 'Configurações',
                ),
                Tab(
                  icon: SvgPicture.asset(
                    AppIcons.thumbsup,
                    color: selectedTabIndex == 2
                        ? Colors.white
                        : AppColors.white.withOpacity(.6),
                  ),
                  text: 'Seguidores',
                ),
                Tab(
                  icon: SvgPicture.asset(
                    AppIcons.newspaper,
                    color: selectedTabIndex == 3
                        ? Colors.white
                        : AppColors.white.withOpacity(.6),
                  ),
                  text: 'Contracto',
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                Text(""), // Feed de notícias
                CommunityPage(), // Dados pessoais e histórico
                FollowerPage(), // Meus palpites
                Center(child: Text('Jogos')), // Jogos próximos
              ],
            ),
          ),
        ],
      ),
    );
  }
}
