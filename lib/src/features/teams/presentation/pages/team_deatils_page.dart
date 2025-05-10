import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game_on/src/core/resources/app_images.dart';
import 'package:game_on/src/core/strings/app_strings.dart';
import 'package:game_on/src/features/teams/presentation/cubit/get_one_team_cubit/get_one_team_cubit.dart';
import 'package:game_on/src/features/teams/presentation/pages/build_equipament_page.dart';
import 'package:get/get.dart';

import '../../../../config/themes/app_colors.dart';
import '../../../../core/resources/app_icons.dart';
import '../../../../core/utils/app_date_utils.dart';
import '../../../home/presentantion/home_page.dart';
import '../../../home/presentantion/old_home';
import '../../domain/entities/team_entity.dart';

class TeamDetailsPage extends StatefulWidget {
  final String teamId;
  const TeamDetailsPage({super.key, required this.teamId});

  @override
  State<TeamDetailsPage> createState() => _TeamDetailsPageState();
}

class _TeamDetailsPageState extends State<TeamDetailsPage>
    with SingleTickerProviderStateMixin {
  final ValueNotifier<String?> selectedType =
      ValueNotifier<String?>("treeBarras");
  final ValueNotifier<Color> selectedMainShirtColor =
      ValueNotifier<Color>(Colors.red);
  final ValueNotifier<Color> selectedStyleShirtColor =
      ValueNotifier<Color>(Colors.blue);

  final Map<String, String> typeToImage = {
    'treeBarras': AppImages.treeBarras,
    'leftOneLongVerticalBar': AppImages.leftOneLongVerticalBar,
  };

  final List<Color> colors = [
    Colors.yellow,
    Colors.black,
    Colors.brown,
    Colors.white,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
  ];
  String selectedCount = '11x11';
  String selectedFormation = '4-4-2';

  final List<String> playerCounts =
      List.generate(11, (i) => '${i + 1}x${i + 1}');
  final List<String> formations = [
    '4-4-2',
    '4-3-3',
    '3-5-2',
    '4-5-1',
    '4-3-1-2',
    '5-4-1',
    '4-3-2-1',
  ];
  List<int> get fieldFormation {
    return selectedFormation.split('-').map(int.parse).toList();
  }

  List<Widget> _buildFormationWithLimit(List<int> formationLines) {
    int totalPlayers = int.tryParse(selectedCount.split('x').first) ?? 11;
    int playersUsed = 0;
    List<Widget> lines = [];

    for (int count in formationLines) {
      if (playersUsed >= totalPlayers) break;

      int remaining = totalPlayers - playersUsed;
      int playersInLine = count <= remaining ? count : remaining;

      lines.add(_buildLine(playersInLine));
      playersUsed += playersInLine;
    }

    // Add goalkeeper at the end if the formation is greater than 1x1
    if (totalPlayers > 1) {
      lines.add(_buildGoalkeeper());
      playersUsed++;
    }

    return lines;
  }

  Widget _buildGoalkeeper() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.red[800],
            child: const Icon(Icons.sports_soccer, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildLine(int playerCount) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(playerCount, (index) {
          return Column(
            children: [
              Container(
                width: 40,
                height: 40,
                // color: Colors.red,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Image.asset(
                        AppImages.mainTShirt,
                        color: Colors.blue.shade900,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: Image.asset(
                        AppImages.bodyBack,
                        color: Colors.black38,
                      ),
                    ),
                    Positioned.fill(
                      child: Center(
                        child: Text(
                          "${index + 1}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    "nome",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }

  late TabController _tabController;
  final int totalPartidas = 6;
  final ValueNotifier<int> partidaAtual = ValueNotifier<int>(3);

  final String backgroundUrl =
      'https://cdn.pixabay.com/photo/2014/10/14/20/24/football-488714_1280.jpg';
  final String profileUrl =
      'https://scontent.flad5-1.fna.fbcdn.net/v/t39.30808-6/468946321_1143394810468991_6731165110528390324_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=wSrOeJxvDDEQ7kNvwEbvT6L&_nc_oc=AdlTqHYlCPFGfrAGQlDwBDoWGWHzOtYBQvPLz5DFEahZRV2c0WoBBuSIrcQrBKYO_91fpJuk6Y9c1v6oU_Uldije&_nc_zt=23&_nc_ht=scontent.flad5-1.fna&_nc_gid=bu1cwd0CKmhmqZJFsKvxIg&oh=00_AfHS3wRkCA00310Cb6BF1t2f-b46KjsWZzhIrcgxTejGig&oe=68048141';
  final String team1Logo =
      'https://scontent.flad5-1.fna.fbcdn.net/v/t39.30808-1/449761244_1062646795218211_4139834764378388664_n.jpg?stp=c196.196.1199.1199a_dst-jpg_s200x200_tt6&_nc_cat=1&ccb=1-7&_nc_sid=2d3e12&_nc_ohc=2PIv9d0zbT4Q7kNvwFrDdyl&_nc_oc=Adnbea-uBG6-Yjz-swaIok52lxeGLlxbFYlST90cK4dm1KdQveMu-MleJfCBBy4zbgL6PbCyY77uA-Jx-87CXmsf&_nc_zt=24&_nc_ht=scontent.flad5-1.fna&_nc_gid=b_6-6aTZFayQsgqhCcyxhQ&oh=00_AfE78XoqOuYLsaL3vLfGnPlltyuw8ZA_dK-vkLTcnXYkEA&oe=68047744';
  final String team2Logo =
      'https://scontent.flad5-1.fna.fbcdn.net/v/t39.30808-1/273144602_10152602977424953_1955203260619408476_n.jpg?stp=dst-jpg_s200x200_tt6&_nc_cat=1&ccb=1-7&_nc_sid=2d3e12&_nc_ohc=q-W_7Ofx0GIQ7kNvwGEJVrU&_nc_oc=Adnh-RBMtZE6Kr9ubdATmRiKH6NAEiVO92HwxQXcJXb10vyt6hqv1nhkO14Pimi4X05KqocWeD2Q83HP7vsW3Xw6&_nc_zt=24&_nc_ht=scontent.flad5-1.fna&_nc_gid=tINtmFSQ5O2qx6UrzJ1Xjg&oh=00_AfFWaHkb26Gz6qnHdeiku917wrHIZY8eRqAgYFACd31o-Q&oe=68047B4B';

  int formationSize = 5;
  String formationSelected = "4-4-2";
  int selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    context.read<GetOneTeamCubit>().getOneTeam(widget.teamId);
  }

  @override
  void dispose() {
    _tabController.dispose();
    selectedType.dispose();
    selectedMainShirtColor.dispose();
    selectedStyleShirtColor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetOneTeamCubit, GetOneTeamState>(
        builder: (context, state) {
          if (state is GetOneTeamLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetOneTeamFailure) {
            return Center(child: Text(state.error));
          } else if (state is GetOneTeamLoaded) {
            final team = state.team;
            return Column(
              children: [
                Container(
                  color: AppColors.primary,
                  child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
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
                          AppIcons.shield,
                          color: selectedTabIndex == 0
                              ? Colors.white
                              : AppColors.white.withOpacity(.6),
                        ),
                        text: 'Detalhes',
                      ),
                      Tab(
                        icon: SvgPicture.asset(
                          AppIcons.soccerBoots,
                          color: selectedTabIndex == 1
                              ? Colors.white
                              : AppColors.white.withOpacity(.6),
                        ),
                        text: 'Jogos',
                      ),
                      Tab(
                        icon: SvgPicture.asset(
                          AppIcons.courtSport,
                          color: selectedTabIndex == 2
                              ? Colors.white
                              : AppColors.white.withOpacity(.6),
                        ),
                        text: 'Plantel',
                      ),
                      Tab(
                        icon: SvgPicture.asset(
                          AppIcons.trophyStar,
                          color: selectedTabIndex == 3
                              ? Colors.white
                              : AppColors.white.withOpacity(.6),
                        ),
                        text: 'Títulos',
                      ),
                      Tab(
                        icon: SvgPicture.asset(
                          AppIcons.footballPlayer,
                          color: selectedTabIndex == 4
                              ? Colors.white
                              : AppColors.white.withOpacity(.6),
                        ),
                        text: 'Jogadores',
                      ),
                      Tab(
                        icon: SvgPicture.asset(
                          AppIcons.newspaper,
                          color: selectedTabIndex == 5
                              ? Colors.white
                              : AppColors.white.withOpacity(.6),
                        ),
                        text: 'News',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildContantTeam(team!),
                      _buildMatchesTeam(team),
                      _buildPlantelTeam(),
                      // _buildSettings(team),
                      _buildTrophiesTeam(),
                      // _buildTeamsList(),
                      // _buildStats(),
                      _buildPlyersTeam(team),
                      _buildNewsTeam()
                    ],
                  ),
                ),
              ],
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildPlyersTeam(TeamEntity team) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.link),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Partilhar link"),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(.1),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Center(
                      child: Text(
                        "?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const TabBar(
              indicatorColor: AppColors.primary,
              labelColor: AppColors.primary,
              unselectedLabelColor: Colors.grey,
              isScrollable: true,
              tabAlignment: TabAlignment.center,
              tabs: [
                Tab(
                  text: 'Jogadores Fictícios',
                ),
                Tab(text: 'Jogadores Reais'),
                // Tab(text: 'Defesas'),
                Tab(text: 'Novo jogador'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // _buildPlayerRealWidget(team),
                  _buildPlayerImaginaryWidget(team),
                  _buildNewPlayerWidget(team),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContantTeam(TeamEntity team) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  // Imagem de capa
                  Image.network(
                    backgroundUrl,
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Container(
                      color: Colors.black54,
                    ),
                  ),
                  Positioned(
                    bottom: -60,
                    child: Stack(
                      children: [
                        (team.logoUrl == null || team.logoUrl!.isEmpty)
                            ? SvgPicture.asset(AppIcons.security)
                            : CircleAvatar(
                                radius: 70, // aumentado o tamanho do círculo
                                backgroundColor: Colors.white,
                                child: CachedNetworkImage(
                                  imageUrl: team.logoUrl!,
                                  imageBuilder: (context, imageProvider) =>
                                      CircleAvatar(
                                    radius: 66, // aumentado o tamanho da imagem
                                    backgroundImage: imageProvider,
                                  ),
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Icon(Icons.verified,
                                color: Colors.blue, size: 22),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 70),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Text(
                      '${team.name}',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              // Informações adicionais
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontFamily: AppStrings.fontFamily,
                  ),
                  children: [
                    const TextSpan(
                      text: '3',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ' Colaboradores • ',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const TextSpan(
                      text: '3,5 M',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ' seguidores',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_on, color: Colors.grey),
              const SizedBox(width: 5),
              Text("${team.location}"),
            ],
          ),
          ListView(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: [
              ListTile(
                leading: SvgPicture.asset(
                  AppIcons.userColor,
                  width: 26,
                ),
                title: Text(
                  'Gerente',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                subtitle: Text(
                  '${team.createdByProfile!.fullName}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              ListTile(
                leading: SvgPicture.asset(
                  AppIcons.flag2,
                  width: 26,
                ),
                title: Text(
                  'Fundado aos',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                subtitle: Text(
                  '${AppDateUtils.formatDate(data: team.foundedAt!)} - (${AppDateUtils.getYearDifference(team.foundedAt!)} anos)',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              ListTile(
                leading: SvgPicture.asset(
                  AppIcons.footballJersey,
                  width: 26,
                ),
                title: Text(
                  'QTD. Jogadores',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                subtitle: Text(
                  team.memberLimit.toString(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: 'Trofeos',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppIcons.medalChampionAward3,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "10",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppIcons.medalChampionAward1,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "1",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppIcons.medalChampionAward2,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "2",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // child: ListTile(
                //   leading: const Icon(Icons.emoji_events, color: Colors.amber),
                //   title: const Text('1000000 \$ - Valor do grande prêmio'),
                // ),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: SvgPicture.asset(
                  AppIcons.money,
                  width: 40,
                ),
                title: const Text('Taxa de registro'),
                subtitle: const Text('10 \$'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTeam(String logoUrl, String name, CrossAxisAlignment align) {
    return Column(
      crossAxisAlignment: align,
      children: [
        Image.network(logoUrl, width: 40, height: 40),
        const SizedBox(height: 8),
        Text(name,
            style: const TextStyle(fontSize: 14),
            overflow: TextOverflow.ellipsis),
      ],
    );
  }

  Widget _buildMatchesTeam(TeamEntity team) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.09),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ValueListenableBuilder<int>(
            valueListenable: partidaAtual,
            builder: (context, value, _) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Botão esquerda
                  Expanded(
                    child: IconButton(
                      icon: const Icon(Icons.chevron_left),
                      onPressed: value > 1 ? () => partidaAtual.value-- : null,
                    ),
                  ),

                  // Dropdown com estilo
                  Center(
                    child: ValueListenableBuilder<int>(
                      valueListenable: partidaAtual,
                      builder: (context, value, _) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () => _showPartidasBottomSheet(context),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 16),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Partida $value / $totalPartidas'),
                                  const SizedBox(width: 8),
                                  const Icon(Icons.arrow_drop_down),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // Botão direita
                  Expanded(
                    child: IconButton(
                      icon: const Icon(Icons.chevron_right),
                      onPressed: value < totalPartidas
                          ? () => partidaAtual.value++
                          : null,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const PlayerHighlightCard(),
              const SizedBox(height: 16),
              const Text(
                "Sem Data Ainda",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              MatchGroupCard(
                team1: "Equipe 2",
                team2: "Equipe 3",
                group: "GRUPO A",
              ),
              MatchGroupCard(
                team1: "Equipe 2",
                team2: "Equipe 3",
                group: "GRUPO A",
              ),
              MatchGroupCard(
                team1: "Equipe 2",
                team2: "Equipe 3",
                group: "GRUPO A",
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showPartidasBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: totalPartidas,
          itemBuilder: (context, index) {
            int num = index + 1;
            return ListTile(
              title: Text('Partida $num / $totalPartidas'),
              onTap: () {
                partidaAtual.value = num;
                Navigator.pop(
                    context); // Fecha o bottom sheet depois de selecionar
              },
            );
          },
        );
      },
    );
  }

  Widget _buildPlayerImaginaryWidget(TeamEntity team) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            itemCount: [].length,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.09),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      "https://fpfimagehandler.fpf.pt/FPFImageHandler.ashx?type=Person&id=3883014&op=t&w=325&h=378",
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: const Text(
                    'Cristiano Ronaldo',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: const Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Row(
                      children: [
                        Text("Atacante"),
                      ],
                    ),
                  ),
                  trailing: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: SvgPicture.asset(
                            width: 20,
                            AppIcons.footballJersey,
                          ),
                        ),
                        const TextSpan(
                          text: " 20",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: AppStrings.fontFamily),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTrophiesTeam() {
    return Center(
      child: Text("Troféos"),
    );
  }

  Widget _buildSettings(TeamEntity team) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OutlinedButton(
              onPressed: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.link),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Se conectar à um torneio"),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Configurações da Equipe",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.black,
                  ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              initialValue: "Dourada FC",
              decoration: const InputDecoration(
                label: Text("Nome da Equipe"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              initialValue: "Gerente",
              decoration: const InputDecoration(
                label: Text("Helder Supremo"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "EQUIPAMENTO / LOGOTIPO",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            print("object");
                            Get.to(BuildEquipamentPage(
                              teamData: {},
                            ));
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(
                                width: 1,
                                color: Colors.grey.shade400,
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        child: Image.asset(
                                          AppImages.mainTShirt,
                                          width: 20,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: Image.asset(
                                            AppImages.backPartTShirt),
                                      ),
                                    ),

                                    // const Text("Equipamento")
                                  ],
                                ),
                                const Text("Equipamentos")
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(
                              width: 1,
                              color: Colors.grey.shade400,
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: SvgPicture.asset(
                                        width: 55,
                                        AppIcons.security,
                                      ),
                                    ),
                                  ),

                                  // const Text("Equipamento")
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("Logotipo")
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              initialValue: "11 de abr. de 2013",
              decoration: const InputDecoration(
                label: Text("Data de Criação"),
              ),
            ),
          ],
        ),
      ),
    );
    // return ListView.builder(
    //   itemCount: matches.length,
    //   itemBuilder: (context, index) {
    //     final match = matches[index];
    //     return Container(
    //       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    //       decoration: BoxDecoration(
    //         color: Colors.white,
    //         borderRadius: BorderRadius.circular(10),
    //         boxShadow: [
    //           BoxShadow(
    //             color: Colors.black.withOpacity(0.09),
    //             blurRadius: 12,
    //             offset: const Offset(0, 4),
    //           ),
    //         ],
    //       ),
    //       child: ListTile(
    //         leading: ClipRRect(
    //           borderRadius: BorderRadius.circular(50),
    //           child: Image.network(
    //             "https://fpfimagehandler.fpf.pt/FPFImageHandler.ashx?type=Person&id=3883014&op=t&w=325&h=378",
    //             width: 40,
    //             height: 40,
    //             fit: BoxFit.cover,
    //           ),
    //         ),
    //         title: Text(
    //           'Bayern Munich',
    //           style: TextStyle(
    //             fontWeight: FontWeight.w600,
    //           ),
    //         ),
    //         subtitle: Padding(
    //           padding: const EdgeInsets.only(top: 5),
    //           child: Row(
    //             children: [
    //               ClipRRect(
    //                 borderRadius: BorderRadius.circular(50),
    //                 child: Container(
    //                   width: 20,
    //                   height: 20,
    //                   child: CachedNetworkImage(imageUrl: match.homeLogo),
    //                 ),
    //               ),
    //               Text("Real Madrid"),
    //             ],
    //           ),
    //         ),
    //         trailing: RichText(
    //           text: TextSpan(
    //             children: [
    //               TextSpan(
    //                 text: "20 ",
    //                 style: TextStyle(
    //                     fontWeight: FontWeight.bold,
    //                     color: Colors.black,
    //                     fontSize: 18,
    //                     fontFamily: AppStrings.fontFamily),
    //               ),
    //               TextSpan(
    //                 text: "Gol.",
    //                 style: TextStyle(
    //                     color: Colors.grey, fontFamily: AppStrings.fontFamily),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     );
    //   },
    // );
  }

  Widget _buildTeamsList(TeamEntity team) {
    return Center();
    // return ListView.builder(
    //   itemCount: matches.length,
    //   itemBuilder: (context, index) {
    //     final match = matches[index];
    //     return Container(
    //       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    //       decoration: BoxDecoration(
    //         color: Colors.white,
    //         borderRadius: BorderRadius.circular(10),
    //         boxShadow: [
    //           BoxShadow(
    //             color: Colors.black.withOpacity(0.09),
    //             blurRadius: 12,
    //             offset: const Offset(0, 4),
    //           ),
    //         ],
    //       ),
    //       child: ListTile(
    //         leading: ClipRRect(
    //           borderRadius: BorderRadius.circular(50),
    //           child: Image.network(
    //             "https://fpfimagehandler.fpf.pt/FPFImageHandler.ashx?type=Person&id=3883014&op=t&w=325&h=378",
    //             width: 40,
    //             height: 40,
    //             fit: BoxFit.cover,
    //           ),
    //         ),
    //         title: Text(
    //           'Bayern Munich',
    //           style: TextStyle(
    //             fontWeight: FontWeight.w600,
    //           ),
    //         ),
    //         subtitle: Padding(
    //           padding: const EdgeInsets.only(top: 5),
    //           child: Row(
    //             children: [
    //               ClipRRect(
    //                 borderRadius: BorderRadius.circular(50),
    //                 child: Container(
    //                   width: 20,
    //                   height: 20,
    //                   child: CachedNetworkImage(imageUrl: match.homeLogo),
    //                 ),
    //               ),
    //               Text("Real Madrid"),
    //             ],
    //           ),
    //         ),
    //         trailing: RichText(
    //           text: TextSpan(
    //             children: [
    //               TextSpan(
    //                 text: "20 ",
    //                 style: TextStyle(
    //                     fontWeight: FontWeight.bold,
    //                     color: Colors.black,
    //                     fontSize: 18,
    //                     fontFamily: AppStrings.fontFamily),
    //               ),
    //               TextSpan(
    //                 text: "Gol.",
    //                 style: TextStyle(
    //                     color: Colors.grey, fontFamily: AppStrings.fontFamily),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     );
    //   },
    // );
  }

  Widget _buildNewPlayerWidget(TeamEntity team) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.09),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: color),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTable() {
    return Column(
      children: [
        // Header row
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          color: AppColors.primary,
          child: const Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  "POS",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Text(
                  "Clube",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "V",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  "E",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  "D",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  "Pts",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        // Table rows
        Expanded(child: Container()),
      ],
    );
  }

  Widget _buildNewsTeam() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final newss = NewsArticle.fromJson(news[index]);
          return Container(
            width: double.infinity,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: newss.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        newss.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppIcons.calendar,
                            width: 16,
                            color: AppColors.color,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text("10/10/2024 10:10"),
                          const SizedBox(
                            width: 10,
                          ),
                          SvgPicture.asset(
                            AppIcons.siteAlt,
                            width: 16,
                            color: AppColors.color,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(newss.sourceStr),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 20,
          );
        },
        itemCount: news.length,
      ),
    );
  }

  Widget playerSlot(String label) {
    return GestureDetector(
      onTap: () {
        // Aqui você pode abrir uma modal ou buscar jogador
        debugPrint("Selecionou: $label");
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green[800],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.add, color: Colors.white),
              Text(label, style: const TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlantelTeam() {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          // Dropdowns
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: DropdownButton<String>(
                      value: selectedCount,
                      onChanged: (value) {
                        if (value != null) {
                          setState(() => selectedCount = value);
                        }
                      },
                      isExpanded: true,
                      underline: SizedBox(),
                      items: playerCounts.map((e) {
                        return DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: DropdownButton<String>(
                      value: selectedFormation,
                      onChanged: (value) {
                        if (value != null) {
                          setState(() => selectedFormation = value);
                        }
                      },
                      isExpanded: true,
                      underline: SizedBox(),
                      items: formations.map((e) {
                        return DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Row(
                    //   children: [
                    //     Text(
                    //       "Titulares",
                    //       style: Theme.of(context).textTheme.titleLarge,
                    //     ),
                    //   ],
                    // ),
                    // const SizedBox(height: 16),
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.green),
                        image: const DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage(
                            AppImages.campoReto,
                          ),
                        ),
                      ),
                      child: Container(
                        // padding: const EdgeInsets.only(bottom: 55),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: _buildFormationWithLimit(
                              fieldFormation.reversed.toList()),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Container(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10, // Adjust the number of items as needed
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        child: Image.asset(
                                          AppImages.mainTShirt,
                                          color: Colors.blue.shade900,
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        right: 0,
                                        top: 0,
                                        bottom: 0,
                                        child: Image.asset(
                                          AppImages.bodyBack,
                                          color: Colors.black38,
                                        ),
                                      ),
                                      Positioned.fill(
                                        child: Center(
                                          child: Text(
                                            "${index + 1}",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "nome",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )

                    // Row(
                    //   children: [
                    //     Text(
                    //       "Suplentes",
                    //       style: Theme.of(context).textTheme.titleLarge,
                    //     ),
                    //     const SizedBox(width: 5),
                    //     Text(
                    //       "[10]",
                    //       style: Theme.of(context)
                    //           .textTheme
                    //           .bodyLarge!
                    //           .copyWith(fontWeight: FontWeight.bold),
                    //     )
                    //   ],
                    // ),
                    // const SizedBox(height: 16),
                    // Wrap(
                    //   spacing: 10,
                    //   runSpacing: 10,
                    //   children: List.generate(7, (index) {
                    //     return Container(
                    //       width: MediaQuery.of(context).size.width / 2 - 30,
                    //       padding: const EdgeInsets.all(10),
                    //       decoration: BoxDecoration(
                    //         color: Colors.blue,
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //       child: Column(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         crossAxisAlignment: CrossAxisAlignment.center,
                    //         children: [
                    //           CircleAvatar(
                    //             radius: 20,
                    //             backgroundImage: AssetImage(AppImages.avatar),
                    //           ),
                    //           const SizedBox(height: 8),
                    //           Text(
                    //             "10",
                    //             style: TextStyle(
                    //               fontWeight: FontWeight.bold,
                    //               fontSize: 16,
                    //               color: Colors.white,
                    //             ),
                    //           ),
                    //           const SizedBox(height: 4),
                    //           Text(
                    //             "Atacante",
                    //             style: TextStyle(
                    //               fontSize: 14,
                    //               color: Colors.white70,
                    //             ),
                    //           ),
                    //           const SizedBox(height: 4),
                    //           Text(
                    //             "Jogador",
                    //             style: TextStyle(
                    //               fontSize: 14,
                    //               color: Colors.white,
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     );
                    //   }),
                    // ),
                  ],
                ),
              ),
            ),
          ),

          // Expanded(
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: Colors.green[100],
          //       borderRadius: BorderRadius.circular(16),
          //       border: Border.all(color: Colors.green),
          //       image: DecorationImage(
          //         fit: BoxFit.fitWidth,
          //         image: AssetImage(
          //           AppImages.campoReto,
          //         ),
          //       ),
          //     ),
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: _buildFormationWithLimit(
          //           fieldFormation.reversed.toList()),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class PlayerHighlightCard extends StatelessWidget {
  const PlayerHighlightCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: const DecorationImage(
              image: CachedNetworkImageProvider(
                  scale: 2.5,
                  // 'https://lh3.googleusercontent.com/gps-cs-s/AB5caB_xM6ql3O50gDkC8Xzk-VYnE0gDSk5WJKT0n7k_eHjSWh6Bp-u8vsFjjly3bupWhkl5BvJ8xIgpc4WVeNU-KZovlL1YhHIbnYxGS2zKElZLvUa6wG-uKoOwdX_CV0sltZ2yvd3z=s1360-w1360-h1020',
                  // 'https://lh3.googleusercontent.com/gps-cs-s/AB5caB8inwH_KFKJm-45QElqe4RYAnwkGyWXDnPucd-VR3Y4b1rMeOpALAn3gtOjFdI-gYmdSwM1NIU2YdgQ7CI5yBvLfnDOoCVnzpxEK3WUeiUbkbUp8uvP6GPe_mg12WT2_rRJ2ZU=s1360-w1360-h1020'),
                  'https://lh3.googleusercontent.com/gps-cs-s/AB5caB9SGdNVDWSoYrRDpwCW8IC3wcBVfEafWXhfonttQOo1eFw5kDuC1f9PCAa6UzA41L46zEunc4G0DLmyIr_SP-Fj4CGltLmWLcCmbk7U2g0kljLeMUVKiiGj3T2Tu2U0LSPhz1Ne=s1360-w1360-h1020'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          top: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'NOVO',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.emoji_events, color: Colors.white, size: 20),
                SizedBox(width: 8),
                Text(
                  'Jogador da semana 1',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MatchGroupCard extends StatelessWidget {
  final String team1;
  final String team2;
  final String group;

  const MatchGroupCard({
    super.key,
    required this.team1,
    required this.team2,
    required this.group,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(.04),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1,
              color: Colors.black12,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TeamRowHome(name: team1),
                    const SizedBox(height: 8),
                    TeamRowAway(name: team2),
                  ],
                ),
                Row(
                  children: [
                    const Column(
                      children: [
                        Text("-", style: TextStyle(fontSize: 18)),
                        SizedBox(height: 8),
                        Text("-", style: TextStyle(fontSize: 18)),
                      ],
                    ),
                    const SizedBox(width: 15),
                    SvgPicture.asset(
                      AppIcons.fileEdit,
                      color: Colors.blue.shade900,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 0, top: 4, bottom: 12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              group,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TeamRowHome extends StatelessWidget {
  final String name;

  const TeamRowHome({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppIcons.security),
        const SizedBox(width: 8),
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class TeamRowAway extends StatelessWidget {
  final String name;

  const TeamRowAway({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppIcons.security),
        const SizedBox(width: 8),
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
