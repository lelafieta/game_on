import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_on/src/core/resources/app_images.dart';
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
                    AppIcons.memo,
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
              children: [
                _buildPlayerProfile(), // Feed de notícias
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

  Widget _buildPlayerProfile() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            width: 250,
            height: 350,
            // decoration: BoxDecoration(
            //   color: Colors.white,
            //   borderRadius: BorderRadius.circular(10),
            //   boxShadow: [
            //     BoxShadow(
            //       blurRadius: 2,
            //       color: Colors.black26,
            //       offset: Offset(0, 2),
            //     ),
            //   ],
            // ),
            child: Stack(
              children: [
                Positioned.fill(
                  top: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      AppImages.avatar,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Image.asset(
                  AppImages.playerCard,
                ),
                const Positioned(
                  top: 45,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      "TÁ FALAR, TÁ FAZER",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // opcional, depende da imagem
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 5,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      "DOURADA FC",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // opcional, depende da imagem
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // child: Column(
            //   children: [
            //     Expanded(
            //       child: Container(
            //         width: double.infinity,
            //         decoration: const BoxDecoration(
            //           borderRadius: BorderRadius.only(
            //             bottomRight: Radius.circular(100),
            //             topLeft: Radius.circular(10),
            //             topRight: Radius.circular(10),
            //           ),
            //           boxShadow: [
            //             BoxShadow(
            //               blurRadius: 2,
            //               color: Colors.black54,
            //               offset: Offset(0, 0),
            //             ),
            //           ],
            //         ),
            //         child: ClipRRect(
            //           borderRadius: const BorderRadius.only(
            //             bottomRight: Radius.circular(100),
            //             topLeft: Radius.circular(10),
            //             topRight: Radius.circular(10),
            //           ),
            //           child: Image.asset(
            //             AppImages.avatar,
            //             fit: BoxFit.cover,
            //             width: double.infinity,
            //             height: 200, // ou outro valor de altura que preferires
            //           ),
            //         ),
            //       ),
            //     ),
            //     Container(
            //       padding: EdgeInsets.all(10),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Text(
            //             "12",
            //             style: TextStyle(
            //                 fontSize: 50,
            //                 fontWeight: FontWeight.bold,
            //                 color: Colors.black,
            //                 shadows: [
            //                   Shadow(
            //                     blurRadius: 2,
            //                     color: Colors.black26,
            //                     offset: Offset(0, 2),
            //                   )
            //                 ]),
            //           ),
            //           SizedBox(width: 10),
            //           Text(
            //             "|",
            //             style: TextStyle(
            //               fontSize: 30,
            //               fontWeight: FontWeight.normal,
            //               color: Colors.black,
            //             ),
            //           ),
            //           SizedBox(width: 10),
            //           Text(
            //             "Bellingahm".toUpperCase(),
            //             style: TextStyle(
            //                 fontSize: 12,
            //                 fontWeight: FontWeight.bold,
            //                 color: Colors.black,
            //                 height: 1,
            //                 overflow: TextOverflow.ellipsis),
            //           ),
            //         ],
            //       ),
            //     )
            //   ],
            // ),
          ),
        ],
      ),
    );
  }
}
