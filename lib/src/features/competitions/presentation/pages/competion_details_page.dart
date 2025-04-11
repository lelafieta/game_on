import 'package:bottom_sheet_bar/bottom_sheet_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_on/src/core/strings/app_strings.dart';
import 'package:scrollable_list_tab_scroller/scrollable_list_tab_scroller.dart';

import '../../../../config/themes/app_colors.dart';
import '../../../../core/resources/app_icons.dart';

class CompetitionDetailsPage extends StatefulWidget {
  const CompetitionDetailsPage({
    super.key,
  });

  @override
  State<CompetitionDetailsPage> createState() => _CompetitionDetailsPageState();
}

class _CompetitionDetailsPageState extends State<CompetitionDetailsPage>
    with SingleTickerProviderStateMixin {
  List<String> menuList = ["Recentes", "Campanhas", "Eventos", "Blogs"];
  int selected = 0;

  final List<Map<String, String>> gridItems = [
    {
      "title": "Champions das Duplas 2023",
      "description": "Minha visão",
    },
    {
      "title": "Torneio Nacional",
      "description": "Minha missão",
    },
    {
      "title": "Workshop de Liderança",
      "description": "Capacitação de líderes",
    },
    {
      "title": "Evento de Caridade",
      "description": "Ajudando comunidades",
    },
    {
      "title": "Campeonato Regional",
      "description": "Unindo talentos locais",
    },
    {
      "title": "Palestra Motivacional",
      "description": "Inspiração para jovens",
    },
  ];

  bool _isLocked = false;
  bool _isCollapsed = true;
  bool _isExpanded = false;
  int _listSize = 5;
  final _bsbController = BottomSheetBarController();
  final _listSizeController = TextEditingController(text: '5');
  late final TabController _tabController;

  final List<MatchModel> matches = List.generate(
    6,
    (index) => MatchModel(
      homeTeam: 'FC Bayern Munich',
      awayTeam: 'Manchester United My team',
      homeScore: 3,
      awayScore: 2,
      minute: 48,
      homePossession: 0.78,
      homeLogo:
          'https://upload.wikimedia.org/wikipedia/pt/9/98/Real_Madrid.png',
      awayLogo:
          'https://upload.wikimedia.org/wikipedia/pt/b/b6/Manchester_United_FC_logo.png',
    ),
  );

  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final List<Map<String, dynamic>> tableData = [
    {"pos": 1, "club": "Victory Greens", "w": 25, "d": 5, "l": 4, "pts": 80},
    {"pos": 2, "club": "Red Devils", "w": 20, "d": 8, "l": 6, "pts": 68},
    {"pos": 3, "club": "Blue Monkeys", "w": 20, "d": 8, "l": 6, "pts": 68},
    {"pos": 4, "club": "Crazy Eagle", "w": 19, "d": 10, "l": 5, "pts": 67},
    {"pos": 5, "club": "Rocky Birds", "w": 19, "d": 10, "l": 5, "pts": 67},
    {"pos": 6, "club": "Blue Lightning", "w": 19, "d": 9, "l": 6, "pts": 66},
    {"pos": 7, "club": "White Clouds", "w": 17, "d": 11, "l": 6, "pts": 62},
    {"pos": 8, "club": "Yellow Submarine", "w": 17, "d": 11, "l": 6, "pts": 58},
    {"pos": 9, "club": "Sharks", "w": 16, "d": 12, "l": 6, "pts": 56},
    {"pos": 10, "club": "King's Team", "w": 15, "d": 12, "l": 7, "pts": 55},
    {"pos": 11, "club": "Fast Cowboys", "w": 15, "d": 3, "l": 16, "pts": 52},
    {"pos": 12, "club": "Green Lentils", "w": 14, "d": 7, "l": 13, "pts": 49},
    {"pos": 13, "club": "Black Eagles", "w": 14, "d": 5, "l": 15, "pts": 47},
    {"pos": 14, "club": "Red Clove", "w": 14, "d": 1, "l": 19, "pts": 42},
    {"pos": 15, "club": "Wild", "w": 0, "d": 0, "l": 34, "pts": 0},
    {"pos": 16, "club": "Snakes", "w": 0, "d": 0, "l": 34, "pts": 0},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomSheetBar(
        backdropColor: Colors.green.withOpacity(0.8),
        locked: true, // Set to true to disable swipe gestures
        controller: _bsbController,
        willPopScope: true,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        ),
        borderRadiusExpanded: const BorderRadius.only(
          topLeft: Radius.circular(0.0),
          topRight: Radius.circular(0.0),
        ),
        boxShadows: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5.0,
            blurRadius: 32.0,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
        expandedBuilder: (scrollController) {
          return DefaultTabController(
            length: 6,
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: AppColors.primary,
                elevation: 0,
                centerTitle: true,
                title: const Text(
                  "Fieta Competition",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      // Navigator.of(context).pop();
                      _bsbController.collapse();
                    },
                    icon: const Icon(Icons.close),
                    color: AppColors.white,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          AppColors.white.withOpacity(.2)),
                    ),
                  )
                ],
              ),
              body: Column(
                children: [
                  Container(
                    color: AppColors.primary,
                    child: TabBar(
                      controller: _tabController,
                      indicatorColor: AppColors.white,
                      labelColor: AppColors.white,
                      unselectedLabelColor: Colors.white70,
                      unselectedLabelStyle: const TextStyle(
                        fontSize: 16,
                        fontFamily: AppStrings.fontFamily,
                      ),
                      labelStyle: const TextStyle(
                        fontSize: 16,
                        fontFamily: AppStrings.fontFamily,
                        fontWeight: FontWeight.bold,
                      ),
                      isScrollable: true,
                      tabs: const [
                        Tab(
                          icon: Icon(Icons.sports_esports),
                          text: 'Jogos',
                        ),
                        Tab(
                          icon: Icon(Icons.emoji_events),
                          text: 'Competições',
                        ),
                        Tab(
                          icon: Icon(Icons.leaderboard),
                          text: 'Classificações',
                        ),
                        Tab(
                          icon: Icon(Icons.star),
                          text: 'Rankings',
                        ),
                        Tab(
                          icon: Icon(Icons.article),
                          text: 'Notícias',
                        ),
                        Tab(
                          icon: Icon(Icons.group),
                          text: 'Equipes',
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        _buildTabContentMatch(
                            List<int>.generate(6, (index) => index + 1)),
                        _buildTabContent(
                            List<int>.generate(6, (index) => index + 7)),
                        _buildTabContentTable(
                            List<int>.generate(6, (index) => index + 13)),
                        _buildTabContentRankings(
                            List<int>.generate(6, (index) => index + 13)),
                        _buildTabContent(
                            List<int>.generate(6, (index) => index + 13)),
                        _buildTabContentTeam(
                            List<int>.generate(6, (index) => index + 13)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        collapsed: TextButton(
          onPressed: () => _bsbController.expand(),
          style: TextButton.styleFrom(
            backgroundColor: AppColors.primary.withOpacity(0.8),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32.0),
                topRight: Radius.circular(32.0),
              ),
            ),
          ),
          child: Text(
            'Click Informações da Competição',
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            if (innerBoxIsScrolled) {}
            return [
              SliverAppBar(
                expandedHeight: 250.0,
                floating: false,
                pinned: true,
                leading: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://scontent.flad5-1.fna.fbcdn.net/v/t39.30808-6/393362262_295776626562301_407325209243642260_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=Ic8klsng5fwQ7kNvwHzz7Nf&_nc_oc=AdnfpQl6hbBQJYG8NDxfcltgT7wZ2nUGUigL3r7qNjmpj0Zf6MEkoTUMmUzVAJuxd5kEjIE0QOLsAaVv8y2WJx_I&_nc_zt=23&_nc_ht=scontent.flad5-1.fna&_nc_gid=zJ3PK8hA85pmF3pUjOPzWw&oh=00_AfHAR3go9D1FnCrF0S0MbAOvYO4fz_Utmyp8lJAfmIuLAg&oe=67FCAEB5",
                          fit: BoxFit.cover,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  CircularProgressIndicator(
                                      value: downloadProgress.progress),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        top: 0,
                        child: Container(
                          color: Colors.black26,
                        ),
                      )
                    ],
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(150.0),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            width: double.infinity,
                            height: 120,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                        ),
                        Positioned(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 5,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor),
                                ),
                                margin: const EdgeInsets.only(left: 16),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "https://scontent.flad5-1.fna.fbcdn.net/v/t39.30808-6/393362262_295776626562301_407325209243642260_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=Ic8klsng5fwQ7kNvwHzz7Nf&_nc_oc=AdnfpQl6hbBQJYG8NDxfcltgT7wZ2nUGUigL3r7qNjmpj0Zf6MEkoTUMmUzVAJuxd5kEjIE0QOLsAaVv8y2WJx_I&_nc_zt=23&_nc_ht=scontent.flad5-1.fna&_nc_gid=zJ3PK8hA85pmF3pUjOPzWw&oh=00_AfHAR3go9D1FnCrF0S0MbAOvYO4fz_Utmyp8lJAfmIuLAg&oe=67FCAEB5",
                                    fit: BoxFit.cover,
                                    progressIndicatorBuilder: (context, url,
                                            downloadProgress) =>
                                        CircularProgressIndicator(
                                            value: downloadProgress.progress),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 70,
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Torneio TikTok",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.black,
                                              ),
                                        ),
                                        const SizedBox(width: 5),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    const Text("Aqui vai uma breve descrição"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ];
          },
          body: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Text(
                          "178",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Seguidores",
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "|",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "2",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Colaborador/es",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all(AppColors.white),
                              backgroundColor:
                                  MaterialStateProperty.all(AppColors.primary),
                              side: const MaterialStatePropertyAll(
                                BorderSide(
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "Seguir",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: OutlinedButton(
                            style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all(AppColors.black),
                              side: const MaterialStatePropertyAll(
                                BorderSide(
                                  color: Colors.black12,
                                  width: 2,
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "+4 Avaliações",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    title: const Text(
                      "Fieta Organizer",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                    subtitle: const Text(
                      "Organizador",
                      style: TextStyle(color: AppColors.black),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () async {},
                          icon: SvgPicture.asset(
                            AppIcons.link,
                            width: 25,
                            height: 25,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          onPressed: () async {},
                          icon: SvgPicture.asset(
                            AppIcons.whatsapp,
                            width: 30,
                            height: 30,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          onPressed: () async {},
                          icon: SvgPicture.asset(
                            AppIcons.facebook,
                            width: 30,
                            height: 30,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          onPressed: () async {},
                          icon: SvgPicture.asset(
                            AppIcons.instagram,
                            width: 30,
                            height: 30,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          onPressed: () async {},
                          icon: SvgPicture.asset(
                            AppIcons.x,
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          width: 30,
                          AppIcons.flagAngola,
                        ),
                        const SizedBox(width: 10),
                        const Text("Angola, Luanda, Kikolo"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "20",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.black,
                                      fontSize: 55),
                            ),
                            Text(
                              "Equipes",
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "57",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.black,
                                      fontSize: 55),
                            ),
                            const Text("Jogadores"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10),
                    child: Text(
                      "Data da Temporada",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Card(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              child: Column(
                                children: [
                                  SvgPicture.asset(AppIcons.calendar),
                                  const SizedBox(height: 5),
                                  Text(
                                    "Data de Início",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            // color: AppColors.black,
                                            ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "01/01/2023", // Replace with your dynamic date
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          color: AppColors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card(
                            child: Column(
                              children: [
                                SvgPicture.asset(AppIcons.calendarBold),
                                const SizedBox(height: 5),
                                Text(
                                  "Data de Término",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          // color: AppColors.black,
                                          ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "01/01/2023", // Replace with your dynamic date
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Patrocinadores",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 16),
                      // scrollDirection: Horizontal,
                      itemCount: gridItems.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 10),
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            width: 200,
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  // Add your icon here
                                  // child: SvgPicture.asset(
                                  //   AppIcons.lightbulbOn,
                                  //   color: Colors.white,
                                  // ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  gridItems[index]["title"]!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                // const SizedBox(height: 5),
                                // Text(
                                //   gridItems[index]["description"]!,
                                //   maxLines: 2,
                                //   overflow: TextOverflow.ellipsis,
                                // ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Method to build tab content (a list of items for now)
  Widget _buildTabContent(List<int> itemList) {
    return ListView.builder(
      itemCount: itemList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            'Item ${itemList[index]}',
            style: const TextStyle(fontSize: 20.0),
          ),
          onTap: () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(itemList[index].toString()),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTabContentMatch(List<int> itemList) {
    return ListView.builder(
      itemCount: matches.length,
      itemBuilder: (context, index) {
        final match = matches[index];
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
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Calendário 8 | 2023",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: _buildTeam(
                        match.homeLogo,
                        match.homeTeam,
                        CrossAxisAlignment.start,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            '${match.homeScore} - ${match.awayScore}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "${match.minute}'",
                            style: const TextStyle(
                                fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: _buildTeam(
                        match.awayLogo,
                        match.awayTeam,
                        CrossAxisAlignment.end,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _buildPossessionBar(match.homePossession),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTabContentTable(List<int> itemList) {
    return Column(
      children: [
        // Cabeçalho fixo
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          color: AppColors.primary,
          child: const Row(
            children: [
              Expanded(
                flex: 0,
                child: SizedBox(
                  width: 40,
                ),
              ),
              Expanded(
                  flex: 6,
                  child: Text("Clube",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.white))),
              Expanded(
                  child: Text("V",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.white))),
              Expanded(
                  child: Text("E",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.white))),
              Expanded(
                  child: Text("D",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.white))),
              Expanded(
                  child: Text("Pts",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.white))),
            ],
          ),
        ),
        // const Divider(height: 1),
        // Lista rolável
        Expanded(
          child: ListView.builder(
            itemCount: tableData.length,
            itemBuilder: (context, index) {
              final item = tableData[index];
              return Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: Colors.grey.shade300)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 0,
                      child: Container(
                        width: 20,
                        child: Text("${item['pos']}"),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                        flex: 6,
                        child: Row(
                          children: [
                            CachedNetworkImage(
                              width: 30,
                              imageUrl:
                                  "https://upload.wikimedia.org/wikipedia/pt/9/98/Real_Madrid.png",
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                item['club'],
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        )),
                    Expanded(child: Text("${item['w']}")),
                    Expanded(child: Text("${item['d']}")),
                    Expanded(child: Text("${item['l']}")),
                    Expanded(
                        child: Text(
                      "${item['pts']}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    )),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
    return SingleChildScrollView(
      child: DataTable(
        sortAscending: true,
        sortColumnIndex: 3,
        horizontalMargin: 10,
        columnSpacing: 5,
        columns: const [
          DataColumn(
            label: Text('POS'),
          ),
          DataColumn(label: Text('CLUB')),
          DataColumn(label: Text('V')),
          DataColumn(label: Text('D')),
          DataColumn(label: Text('E')),
          DataColumn(label: Text('PTS')),
        ],
        rows: tableData.map((team) {
          return DataRow(
            cells: [
              DataCell(
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${team['pos']}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    CachedNetworkImage(
                      imageUrl:
                          "https://upload.wikimedia.org/wikipedia/pt/9/98/Real_Madrid.png",
                    ),
                  ],
                ),
              ),
              DataCell(Text('${team['club']}')),
              DataCell(Text('${team['w']}')),
              DataCell(Text('${team['d']}')),
              DataCell(Text('${team['l']}')),
              DataCell(Text('${team['pts']}')),
            ],
          );
        }).toList(),
      ),
    );
    return ListView.builder(
      itemCount: itemList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            'Item ${itemList[index]}',
            style: const TextStyle(fontSize: 20.0),
          ),
          onTap: () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(itemList[index].toString()),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTabContentTeam(List<int> itemList) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemCount: itemList.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              // color: AppColors.primary,
              borderRadius: BorderRadius.circular(50),
            ),
            child: CachedNetworkImage(
              imageUrl:
                  "https://upload.wikimedia.org/wikipedia/pt/9/98/Real_Madrid.png",
              fit: BoxFit.contain,
            ),
          ),
          title: Text(
            'Real Madrid',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
          ),
          subtitle: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "6 ",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                ),
                TextSpan(
                  text: "Jogadores",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.black45),
                ),
              ],
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(itemList[index].toString()),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTabContentRankings(List<int> itemList) {
    final data = {
      "Melhores Marcadores": [
        "Item 1 (A)",
        "Item 2 (A)",
        "Item 3 (A)",
        "Item 4 (A)",
      ],
      "Melhores Assistentes": [
        "Item 1 (B)",
        "Item 2 (B)",
      ],
      "Melhor Ataque": [
        "Item 1 (C)",
        "Item 2 (C)",
        "Item 3 (C)",
        "Item 4 (C)",
        "Item 5 (C)",
      ],
      "Melhor Defesa": [
        "Item 1 (D)",
        "Item 2 (D)",
        "Item 3 (D)",
        "Item 4 (D)",
      ],
    };
    return DefaultTabController(
      length: data.keys.length,
      child: Column(
        children: [
          Container(
            color: AppColors.primary,
            child: TabBar(
              isScrollable: true,
              indicatorColor: AppColors.white,
              labelColor: AppColors.white,
              unselectedLabelColor: Colors.white70,
              tabs: data.keys
                  .map((category) => Tab(
                        text: category,
                      ))
                  .toList(),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: data.keys.map((category) {
                final items = data[category]!;
                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      title: Text(items[index]),
                      subtitle: Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              // color: AppColors.primary,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: CachedNetworkImage(
                              imageUrl:
                                  "https://upload.wikimedia.org/wikipedia/pt/9/98/Real_Madrid.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Real Madrid"),
                        ],
                      ),
                      trailing: Text(
                        "10",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black,
                                ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
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

  Widget _buildPossessionBar(double homePercentage) {
    final awayPercentage = 1 - homePercentage;

    return Row(
      children: [
        Text('${(homePercentage * 100).toInt()}%',
            style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(width: 8),
        Expanded(
          child: Stack(
            children: [
              Container(
                  height: 6,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10))),
              Row(
                children: [
                  Expanded(
                    flex: (homePercentage * 100).toInt(),
                    child: Container(
                        height: 6,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  Expanded(
                    flex: (awayPercentage * 100).toInt(),
                    child: Container(),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Text('${(awayPercentage * 100).toInt()}%',
            style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class MatchModel {
  final String homeTeam;
  final String awayTeam;
  final int homeScore;
  final int awayScore;
  final int minute;
  final double homePossession; // 0.0 to 1.0
  final String homeLogo;
  final String awayLogo;

  MatchModel({
    required this.homeTeam,
    required this.awayTeam,
    required this.homeScore,
    required this.awayScore,
    required this.minute,
    required this.homePossession,
    required this.homeLogo,
    required this.awayLogo,
  });
}
