import 'dart:ui';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_on/src/config/routes/app_routes.dart';
import 'package:game_on/src/features/competitions/presentation/pages/my_competion_details_page.dart';
import 'package:game_on/src/features/competitions/presentation/pages/list_my_competitions_page.dart';
import 'package:game_on/src/features/home/presentantion/home_page.dart';
import 'package:game_on/src/features/live_games/presentation/pages/live_game_page.dart';
import 'package:game_on/src/features/organizers/presentation/pages/organizer_page.dart';
import 'package:game_on/src/features/teams/presentation/pages/team_deatils_page.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

import '../../../config/themes/app_colors.dart';
import '../../../core/resources/app_icons.dart';
import '../../../core/resources/app_images.dart';
import '../../settings/presentation/pages/settings_page.dart';
import 'menu_page.dart';

class GameOnPage extends StatefulWidget {
  final int? index;
  const GameOnPage({super.key, this.index});

  @override
  State<GameOnPage> createState() => _GameOnPageState();
}

class _GameOnPageState extends State<GameOnPage> {
  var _currentIndex = 0;

  late List<Widget> widgets;

  @override
  void initState() {
    super.initState();
    widgets = [
      // OrganizerPage(),
      HomePage(
        index: widget.index,
      ),
      // TeamDetailsPage(),
      // CompetitionDetailsPage(),
      // Text("data"),
      const OrganizerPage(),
      // Text("data"),
      // MyCompetitionsListPage(),
      const Text("data"),
      // LiveGamePage(),
      const Text("data"),
      const SettingsPage(),
    ];
  }

  List<String> iconList = [
    AppIcons.houseChimney,
    AppIcons.whistle,
    AppIcons.bellNotificationSocialMedia,
    AppIcons.videoCameraAlt,
    AppIcons.settings2
  ];

  List<String> iconListBold = [
    AppIcons.houseChimneyBold,
    AppIcons.whistleBold,
    AppIcons.bellNotificationSocialMedia,
    AppIcons.videoCameraAltBold,
    AppIcons.settings2
  ];

  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //   length: 5,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text('Game On'),
    //       leading: Builder(
    //         builder: (context) => IconButton(
    //           icon: SvgPicture.asset(
    //             AppIcons.barsSort,
    //             width: 20,
    //           ),
    //           onPressed: () => Scaffold.of(context).openDrawer(),
    //         ),
    //       ),
    //       actions: [
    //         IconButton(
    //           onPressed: () {},
    //           icon: SvgPicture.asset(
    //             width: 22,
    //             AppIcons.search,
    //           ),
    //         ),
    //         IconButton(
    //           onPressed: () {},
    //           icon: SvgPicture.asset(
    //             AppIcons.bellNotificationSocialMedia,
    //           ),
    //         ),
    //         IconButton(
    //           onPressed: () {},
    //           icon: SvgPicture.asset(
    //             AppIcons.settings,
    //           ),
    //         ),
    //       ],
    //       backgroundColor: AppColors.primary,
    //       bottom: TabBar(
    //         indicatorColor: Colors.white,
    //         tabs: [
    //           Tab(icon: SvgPicture.asset(iconList[0], width: 20)),
    //           Tab(icon: SvgPicture.asset(iconList[1], width: 20)),
    //           Tab(icon: SvgPicture.asset(iconList[2], width: 20)),
    //           Tab(icon: SvgPicture.asset(iconList[3], width: 20)),
    //           Tab(icon: SvgPicture.asset(iconList[4], width: 20)),
    //         ],
    //       ),
    //     ),
    // drawer: Drawer(
    //   child: SafeArea(
    //     child: ListView(
    //       padding: EdgeInsets.zero,
    //       children: [
    //         // DrawerHeader(
    //         //   decoration: const BoxDecoration(
    //         //     color: AppColors.primary,
    //         //   ),
    //         //   child: ListTile(
    //         //     contentPadding: const EdgeInsets.all(0),
    //         //     title: Row(
    //         //       children: [
    //         //         const Text(
    //         //           'Olá! Bem-vindo',
    //         //           style: TextStyle(fontSize: 12),
    //         //         ),
    //         //         const SizedBox(
    //         //           width: 5,
    //         //         ),
    //         //         Image.asset(
    //         //           AppImages.wave,
    //         //           width: 16,
    //         //         ),
    //         //       ],
    //         //     ),
    //         //     subtitle: const Text(
    //         //       'Jesse Lingard',
    //         //       style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
    //         //     ),
    //         //     leading: const CircleAvatar(
    //         //       backgroundImage: AssetImage(AppImages.avatar),
    //         //     ),
    //         //     // trailing: Container(
    //         //     //   width: 100,
    //         //     //   child: Row(
    //         //     //     children: [
    //         //     //       IconButton(
    //         //     //         onPressed: () {},
    //         //     //         icon: SvgPicture.asset(
    //         //     //           AppIcons.bellNotificationSocialMedia,
    //         //     //           color: AppColors.color,
    //         //     //           width: 24,
    //         //     //         ),
    //         //     //       ),
    //         //     //       IconButton(
    //         //     //         onPressed: () {},
    //         //     //         icon: SvgPicture.asset(AppIcons.barsStaggered,
    //         //     //             width: 24, color: AppColors.color),
    //         //     //       )
    //         //     //     ],
    //         //     //   ),
    //         //     // ),
    //         //   ),
    //         // ),
    //         Container(
    //           padding: const EdgeInsets.all(16.0),
    //           child: Text(
    //             "Painel",
    //             style: TextStyle(
    //               fontSize: 16,
    //               color: AppColors.primary,
    //               fontWeight: FontWeight.w600,
    //             ),
    //           ),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 16),
    //           child: ListTile(
    //             contentPadding: const EdgeInsets.all(0),
    //             title: Row(
    //               children: [
    //                 const Text(
    //                   'Perfil de Organizador',
    //                   style: TextStyle(fontSize: 12),
    //                 ),
    //                 const SizedBox(
    //                   width: 5,
    //                 ),
    //                 Image.asset(
    //                   AppImages.wave,
    //                   width: 16,
    //                 ),
    //               ],
    //             ),
    //             subtitle: const Text(
    //               'Lela Fieta',
    //               style:
    //                   TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
    //             ),
    //             leading: const CircleAvatar(
    //               backgroundImage: AssetImage(AppImages.avatar),
    //             ),
    //           ),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 16),
    //           child: ListTile(
    //             contentPadding: const EdgeInsets.all(0),
    //             title: Row(
    //               children: [
    //                 const Text(
    //                   'Perfil de jogador',
    //                   style: TextStyle(fontSize: 12),
    //                 ),
    //               ],
    //             ),
    //             subtitle: const Text(
    //               'Jesse Lingard',
    //               style:
    //                   TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
    //             ),
    //             leading: const CircleAvatar(
    //               backgroundImage: AssetImage(AppImages.avatar),
    //             ),
    //           ),
    //         ),
    //         ListTile(
    //           leading: Icon(Icons.settings),
    //           title: Text('Settings'),
    //           onTap: () {
    //             Navigator.pop(context);
    //           },
    //         ),
    //         ListTile(
    //           leading: Icon(Icons.logout),
    //           title: Text('Logout'),
    //           onTap: () {
    //             Navigator.pop(context);
    //           },
    //         ),
    //       ],
    //     ),
    //   ),
    // ),
    //     body: TabBarView(
    //       children: widgets,
    //     ),
    //   ),
    // );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Torneio X",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppIcons.bellNotificationSocialMedia,
                color: AppColors.white,
              ))
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        title: const Text(
                          'Jesse Lingard',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          'Organizador',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white.withOpacity(.3),
                          ),
                        ),
                        leading: const CircleAvatar(
                          backgroundImage: AssetImage(AppImages.avatar),
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            width: 18,
                            AppIcons.convertShapes,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      child: const Text(
                        "Painel",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        AppIcons.achievementChallengeMedal,
                        width: 26,
                      ),
                      title: Text('Campeonatos'),
                      onTap: () {
                        Navigator.pushNamed(
                            context, AppRoutes.listMyCompetitions);
                      },
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        AppIcons.emblem,
                        width: 26,
                      ),
                      title: Text('Equipas'),
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.listMyTeams);
                      },
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        AppIcons.contractPaper,
                        width: 26,
                      ),
                      title: Text('Inscrições'),
                      onTap: () {
                        // Navigator.pop(context)
                      },
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        AppIcons.settings2,
                        width: 26,
                      ),
                      title: Text('Configurações'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.logout),
                      title: Text('Logout'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              Text("Pacotes")
            ],
          ),
        ),
      ),
      body: widgets[_currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        backgroundColor: Colors.white,
        itemCount: 5,
        activeIndex: _currentIndex,
        gapLocation: GapLocation.none,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 0,
        rightCornerRadius: 0,
        height: 60,
        shadow: BoxShadow(
          color: AppColors.shadow.withOpacity(.1),
          blurRadius: 100,
        ),
        onTap: (index) => setState(() => _currentIndex = index),
        tabBuilder: (int index, bool isActive) {
          return IconButton(
            icon: SvgPicture.asset(
              (isActive) ? iconListBold[index] : iconList[index],
              width: 20,
              color:
                  (isActive) ? AppColors.primary : Colors.black.withOpacity(.6),
            ),
            onPressed: () => setState(() => _currentIndex = index),
          );
        },
      ),
      // floatingActionButton: SpeedDial(
      //   closedForegroundColor: Colors.white,
      //   openForegroundColor: Colors.white,
      //   closedBackgroundColor: AppColors.primary,
      //   openBackgroundColor: AppColors.black,
      //   labelsBackgroundColor: Colors.white,
      //   labelsStyle: const TextStyle(
      //     fontWeight: FontWeight.bold,
      //     color: Colors.black,
      //   ),
      //   speedDialChildren: <SpeedDialChild>[
      //     SpeedDialChild(
      //       child: Padding(
      //         padding: const EdgeInsets.all(5),
      //         child: SvgPicture.asset(
      //           AppIcons.competitionchampion,
      //         ),
      //       ),
      //       foregroundColor: Colors.white,
      //       backgroundColor: Colors.blue.shade900,
      //       label: 'Novo Torneio',
      //       onPressed: () {
      //         Get.toNamed(AppRoutes.createCompetition);
      //       },
      //       closeSpeedDialOnPressed: false,
      //     ),
      //     SpeedDialChild(
      //       child: Padding(
      //         padding: EdgeInsets.all(5),
      //         child: SvgPicture.asset(
      //           AppIcons.footballJersey,
      //         ),
      //       ),
      //       foregroundColor: Colors.black,
      //       backgroundColor: Colors.indigoAccent.shade700,
      //       label: 'Nova Equipe',
      //       onPressed: () {
      //         setState(() {
      //           // _text = 'You pressed \"Let\'s go for a walk!\"';
      //         });
      //       },
      //     ),
      //     SpeedDialChild(
      //       child: Padding(
      //         padding: EdgeInsets.all(5),
      //         child: SvgPicture.asset(
      //           AppIcons.copyLink,
      //         ),
      //       ),
      //       foregroundColor: Colors.black,
      //       backgroundColor: Colors.red,
      //       label: 'Conectar-se a um torneio',
      //       onPressed: () {
      //         setState(() {
      //           // _text = 'You pressed \"Let\'s go for a walk!\"';
      //         });
      //       },
      //     ),
      //     // SpeedDialChild(
      //     //   child: Padding(
      //     //     padding: EdgeInsets.all(5),
      //     //     child: SvgPicture.asset(
      //     //       AppIcons.copyLink,
      //     //     ),
      //     //   ),
      //     //   foregroundColor: Colors.black,
      //     //   backgroundColor: Colors.yellow,
      //     //   label: 'Convidar equipe',
      //     //   onPressed: () {
      //     //     setState(() {
      //     //       // _text = 'You pressed \"Let\'s go for a walk!\"';
      //     //     });
      //     //   },
      //     // ),
      //   ],
      //   child: Icon(Icons.add),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showBlurModal(context),
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildItem(String iconPath, String label, Callback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: ListTile(
        leading: SvgPicture.asset(
          iconPath,
          width: 24,
          height: 24,
        ),
        title: Text(
          label,
          style: const TextStyle(fontSize: 18),
        ),
        onTap: onTap,
      ),
    );
  }

  void _showBlurModal(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Material(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "MENU BÁSICO",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Divider(color: Colors.grey.shade300),
                    _buildItem(AppIcons.competitionchampion, "Novo Campeonato",
                        () {
                      Get.toNamed(AppRoutes.createCompetition);
                    }),
                    _buildItem(AppIcons.footballJersey, "Nova Equipe", () {
                      Get.toNamed(AppRoutes.createTeam);
                    }),
                    _buildItem(AppIcons.userColor, "Novo Jogador", () {}),
                    _buildItem(
                        AppIcons.copyLink, "Participar em torneio", () {}),
                    _buildItem(AppIcons.copyLink, "Convidar Equipes", () {}),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
