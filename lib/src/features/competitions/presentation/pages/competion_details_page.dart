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
import '../../../home/presentantion/home_page.dart';

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
    _tabController = TabController(length: 7, vsync: this);
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
            length: 7,
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
                        Tab(
                          icon: Icon(Icons.group),
                          text: 'Mídia',
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
                        _buildTabContentNews(
                            List<int>.generate(6, (index) => index + 13)),
                        _buildTabContentTeam(
                            List<int>.generate(6, (index) => index + 13)),
                        _buildTabContentMidia(
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
                            const Text(
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
    // return SingleChildScrollView(
    //   child: DataTable(
    //     sortAscending: true,
    //     sortColumnIndex: 3,
    //     horizontalMargin: 10,
    //     columnSpacing: 5,
    //     columns: const [
    //       DataColumn(
    //         label: Text('POS'),
    //       ),
    //       DataColumn(label: Text('CLUB')),
    //       DataColumn(label: Text('V')),
    //       DataColumn(label: Text('D')),
    //       DataColumn(label: Text('E')),
    //       DataColumn(label: Text('PTS')),
    //     ],
    //     rows: tableData.map((team) {
    //       return DataRow(
    //         cells: [
    //           DataCell(
    //             Row(
    //               children: [
    //                 Expanded(
    //                   child: Text(
    //                     '${team['pos']}',
    //                     style: const TextStyle(
    //                       fontSize: 16,
    //                       fontWeight: FontWeight.bold,
    //                       color: Colors.black,
    //                     ),
    //                   ),
    //                 ),
    //                 CachedNetworkImage(
    //                   imageUrl:
    //                       "https://upload.wikimedia.org/wikipedia/pt/9/98/Real_Madrid.png",
    //                 ),
    //               ],
    //             ),
    //           ),
    //           DataCell(Text('${team['club']}')),
    //           DataCell(Text('${team['w']}')),
    //           DataCell(Text('${team['d']}')),
    //           DataCell(Text('${team['l']}')),
    //           DataCell(Text('${team['pts']}')),
    //         ],
    //       );
    //     }).toList(),
    //   ),
    // );
    // return ListView.builder(
    //   itemCount: itemList.length,
    //   itemBuilder: (context, index) {
    //     return ListTile(
    //       title: Text(
    //         'Item ${itemList[index]}',
    //         style: const TextStyle(fontSize: 20.0),
    //       ),
    //       onTap: () => showDialog(
    //         context: context,
    //         builder: (context) => AlertDialog(
    //           title: Text(itemList[index].toString()),
    //         ),
    //       ),
    //     );
    //   },
    // );
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

  Widget _buildTabContentNews(List<int> itemList) {
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

  Widget _buildTabContentMidia(List<int> itemList) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Number of columns
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: itemList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Image.network(
                jsonData[index % jsonData.length]['logo'],
                fit: BoxFit.cover,
              ),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              jsonData[index % jsonData.length]['logo'],
              fit: BoxFit.cover,
            ),
          ),
        );
      },
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

final List<Map<String, dynamic>> jsonData = [
  {
    "id": 42,
    "name": "Champions League",
    "localizedName": "Champions League",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/42.png"
  },
  {
    "id": 73,
    "name": "Europa League",
    "localizedName": "Europa League",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/73.png"
  },
  {
    "id": 9470,
    "name": "AFC Challenge League",
    "localizedName": "AFC Challenge League",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/9470.png"
  },
  {
    "id": 525,
    "name": "AFC Champions League Elite",
    "localizedName": "AFC Champions League Elite",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/525.png"
  },
  {
    "id": 10622,
    "name": "AFC Champions League Elite Qualification",
    "localizedName": "AFC Champions League Elite Qualification",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10622.png"
  },
  {
    "id": 9469,
    "name": "AFC Champions League Two",
    "localizedName": "AFC Champions League Two",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/9469.png"
  },
  {
    "id": 10511,
    "name": "AFC Summer Olympics Qualification (Women)",
    "localizedName": "AFC Summer Olympics Qualification (Women)",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10511.png"
  },
  {
    "id": 9841,
    "name": "AFC U20 Asian Cup",
    "localizedName": "AFC U20 Asian Cup",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/9841.png"
  },
  {
    "id": 9265,
    "name": "AFF Championship",
    "localizedName": "AFF Championship",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/9265.png"
  },
  {
    "id": 289,
    "name": "Africa Cup of Nations",
    "localizedName": "Africa Cup of Nations",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/289.png"
  },
  {
    "id": 10608,
    "name": "Africa Cup of Nations Qualification",
    "localizedName": "Africa Cup of Nations Qualification",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10608.png"
  },
  {
    "id": 10508,
    "name": "African Football League",
    "localizedName": "African Football League",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10508.png"
  },
  {
    "id": 9428,
    "name": "African Nations Championship",
    "localizedName": "African Nations Championship",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/9428.png"
  },
  {
    "id": 9579,
    "name": "Algarve Cup (W)",
    "localizedName": "Algarve Cup (W)",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/9579.png"
  },
  {
    "id": 10474,
    "name": "Arab Club Champions Cup",
    "localizedName": "Arab Club Champions Cup",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10474.png"
  },
  {
    "id": 290,
    "name": "Asian Cup",
    "localizedName": "Asian Cup",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/290.png"
  },
  {
    "id": 10609,
    "name": "Asian Cup  Qualification Playoff",
    "localizedName": "Asian Cup  Qualification Playoff",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10609.png"
  },
  {
    "id": 9833,
    "name": "Asian Games",
    "localizedName": "Asian Games",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/9833.png"
  },
  {
    "id": 10656,
    "name": "Beta Squad vs Amp Charity",
    "localizedName": "Beta Squad vs Amp Charity",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10656.png"
  },
  {
    "id": 526,
    "name": "CAF Champions League",
    "localizedName": "CAF Champions League",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/526.png"
  },
  {
    "id": 10619,
    "name": "CAF Champions League Qualification",
    "localizedName": "CAF Champions League Qualification",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10619.png"
  },
  {
    "id": 9468,
    "name": "CAF Confed Cup",
    "localizedName": "CAF Confed Cup",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/9468.png"
  },
  {
    "id": 9467,
    "name": "CAF Super Cup",
    "localizedName": "CAF Super Cup",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/9467.png"
  },
  {
    "id": 9875,
    "name": "Campeones Cup",
    "localizedName": "Campeones Cup",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/9875.png"
  },
  {
    "id": 10611,
    "name": "Champions League Qualification",
    "localizedName": "Champions League Qualification",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10611.png"
  },
  {
    "id": 489,
    "name": "Club Friendlies",
    "localizedName": "Club Friendlies",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/489.png"
  },
  {
    "id": 9682,
    "name": "CONCACAF Central American Cup",
    "localizedName": "CONCACAF Central American Cup",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/9682.png"
  },
  {
    "id": 297,
    "name": "CONCACAF Champions Cup",
    "localizedName": "CONCACAF Champions Cup",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/297.png"
  },
  {
    "id": 9656,
    "name": "CONCACAF Championship U20",
    "localizedName": "CONCACAF Championship U20",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/9656.png"
  },
  {
    "id": 10621,
    "name": "CONCACAF Championship U20 Qualification",
    "localizedName": "CONCACAF Championship U20 Qualification",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10621.png"
  },
  {
    "id": 298,
    "name": "CONCACAF Gold Cup",
    "localizedName": "CONCACAF Gold Cup",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/298.png"
  },
  {
    "id": 10603,
    "name": "CONCACAF Gold Cup Women",
    "localizedName": "CONCACAF Gold Cup Women",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10603.png"
  },
  {
    "id": 9821,
    "name": "CONCACAF Nations League",
    "localizedName": "CONCACAF Nations League",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/9821.png"
  },
  {
    "id": 10216,
    "name": "Conference League",
    "localizedName": "Conference League",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10216.png"
  },
  {
    "id": 10615,
    "name": "Conference League Qualification",
    "localizedName": "Conference League Qualification",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10615.png"
  },
  {
    "id": 44,
    "name": "Copa America",
    "localizedName": "Copa America",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/44.png"
  },
  {
    "id": 10368,
    "name": "Copa America Femenina",
    "localizedName": "Copa America Femenina",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10368.png"
  },
  {
    "id": 45,
    "name": "Copa Libertadores",
    "localizedName": "Copa Libertadores",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/45.png"
  },
  {
    "id": 10618,
    "name": "Copa Libertadores Qualification",
    "localizedName": "Copa Libertadores Qualification",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10618.png"
  },
  {
    "id": 299,
    "name": "Copa Sudamericana",
    "localizedName": "Copa Sudamericana",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/299.png"
  },
  {
    "id": 10623,
    "name": "Copa Sudamericana Qualification",
    "localizedName": "Copa Sudamericana Qualification",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10623.png"
  },
  {
    "id": 300,
    "name": "East Asian Championship",
    "localizedName": "East Asian Championship",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/300.png"
  },
  {
    "id": 50,
    "name": "EURO",
    "localizedName": "EURO",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/50.png"
  },
  {
    "id": 10607,
    "name": "EURO Qualification",
    "localizedName": "EURO Qualification",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10607.png"
  },
  {
    "id": 287,
    "name": "EURO U19",
    "localizedName": "EURO U19",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/287.png"
  },
  {
    "id": 288,
    "name": "EURO U21",
    "localizedName": "EURO U21",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/288.png"
  },
  {
    "id": 10437,
    "name": "EURO U-21 Qualification",
    "localizedName": "EURO U-21 Qualification",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10437.png"
  },
  {
    "id": 10613,
    "name": "Europa League Qualification",
    "localizedName": "Europa League Qualification",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10613.png"
  },
  {
    "id": 301,
    "name": "European Championship U-17",
    "localizedName": "European Championship U-17",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/301.png"
  },
  {
    "id": 78,
    "name": "FIFA Club World Cup",
    "localizedName": "FIFA Club World Cup",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/78.png"
  },
  {
    "id": 10703,
    "name": "FIFA Intercontinental Cup",
    "localizedName": "FIFA Intercontinental Cup",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10703.png"
  },
  {
    "id": 10304,
    "name": "Finalissima",
    "localizedName": "Finalissima",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10304.png"
  },
  {
    "id": 114,
    "name": "Friendlies",
    "localizedName": "Friendlies",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/114.png"
  },
  {
    "id": 344,
    "name": "Friendlies U-21",
    "localizedName": "Friendlies U-21",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/344.png"
  },
  {
    "id": 329,
    "name": "Gulf Cup",
    "localizedName": "Gulf Cup",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/329.png"
  },
  {
    "id": 10043,
    "name": "Leagues Cup",
    "localizedName": "Leagues Cup",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10043.png"
  },
  {
    "id": 10649,
    "name": "NWSL x Liga MX",
    "localizedName": "NWSL x Liga MX",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10649.png"
  },
  {
    "id": 491,
    "name": "Recopa Sudamericana",
    "localizedName": "Recopa Sudamericana",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/491.png"
  },
  {
    "id": 9876,
    "name": "SAFF Championship",
    "localizedName": "SAFF Championship",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/9876.png"
  },
  {
    "id": 9921,
    "name": "SheBelieves Cup (W)",
    "localizedName": "SheBelieves Cup (W)",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/9921.png"
  },
  {
    "id": 10312,
    "name": "Sidemen Charity Match",
    "localizedName": "Sidemen Charity Match",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10312.png"
  },
  {
    "id": 9690,
    "name": "Southeast Asian Games",
    "localizedName": "Southeast Asian Games",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/9690.png"
  },
  {
    "id": 66,
    "name": "Summer Olympics",
    "localizedName": "Summer Olympics",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/66.png"
  },
  {
    "id": 65,
    "name": "Summer Olympics (Women)",
    "localizedName": "Summer Olympics (Women)",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/65.png"
  },
  {
    "id": 10498,
    "name": "Summer Olympics Qualification CONCACAF (W)",
    "localizedName": "Summer Olympics Qualification CONCACAF (W)",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10498.png"
  },
  {
    "id": 9514,
    "name": "The Atlantic Cup",
    "localizedName": "The Atlantic Cup",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/9514.png"
  },
  {
    "id": 305,
    "name": "Toulon Tournament",
    "localizedName": "Toulon Tournament",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/305.png"
  },
  {
    "id": 9806,
    "name": "UEFA Nations League A",
    "localizedName": "UEFA Nations League A",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/9806.png"
  },
  {
    "id": 10557,
    "name": "UEFA Nations League A Qualification",
    "localizedName": "UEFA Nations League A Qualification",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10557.png"
  },
  {
    "id": 10717,
    "name": "UEFA Nations League A Qualification",
    "localizedName": "UEFA Nations League A Qualification",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10717.png"
  },
  {
    "id": 9807,
    "name": "UEFA Nations League B",
    "localizedName": "UEFA Nations League B",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/9807.png"
  },
  {
    "id": 10558,
    "name": "UEFA Nations League B Qualification",
    "localizedName": "UEFA Nations League B Qualification",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10558.png"
  },
  {
    "id": 10718,
    "name": "UEFA Nations League B Qualification",
    "localizedName": "UEFA Nations League B Qualification",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10718.png"
  },
  {
    "id": 10458,
    "name": "UEFA Nations League B Women",
    "localizedName": "UEFA Nations League B Women",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10458.png"
  },
  {
    "id": 9808,
    "name": "UEFA Nations League C",
    "localizedName": "UEFA Nations League C",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/9808.png"
  },
  {
    "id": 10719,
    "name": "UEFA Nations League C Qualification",
    "localizedName": "UEFA Nations League C Qualification",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10719.png"
  },
  {
    "id": 10459,
    "name": "UEFA Nations League C Women",
    "localizedName": "UEFA Nations League C Women",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10459.png"
  },
  {
    "id": 9809,
    "name": "UEFA Nations League D",
    "localizedName": "UEFA Nations League D",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/9809.png"
  },
  {
    "id": 74,
    "name": "UEFA Super Cup",
    "localizedName": "UEFA Super Cup",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/74.png"
  },
  {
    "id": 10457,
    "name": "UEFA Women's Nations League",
    "localizedName": "UEFA Women's Nations League",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10457.png"
  },
  {
    "id": 9741,
    "name": "UEFA Youth League",
    "localizedName": "UEFA Youth League",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/9741.png"
  },
  {
    "id": 10269,
    "name": "Womens Asian Cup",
    "localizedName": "Womens Asian Cup",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10269.png"
  },
  {
    "id": 9375,
    "name": "Women's Champions League",
    "localizedName": "Women's Champions League",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/9375.png"
  },
  {
    "id": 10612,
    "name": "Women's Champions League Qualification",
    "localizedName": "Women's Champions League Qualification",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10612.png"
  },
  {
    "id": 292,
    "name": "Women's EURO Qualification",
    "localizedName": "Women's EURO Qualification",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/292.png"
  },
  {
    "id": 10640,
    "name": "Women's EURO Qualification League A",
    "localizedName": "Women's EURO Qualification League A",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10640.png"
  },
  {
    "id": 10641,
    "name": "Women's EURO Qualification League B",
    "localizedName": "Women's EURO Qualification League B",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10641.png"
  },
  {
    "id": 10642,
    "name": "Women's EURO Qualification League C",
    "localizedName": "Women's EURO Qualification League C",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10642.png"
  },
  {
    "id": 293,
    "name": "Women's Friendlies",
    "localizedName": "Women's Friendlies",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/293.png"
  },
  {
    "id": 76,
    "name": "Women's World Cup",
    "localizedName": "Women's World Cup",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/76.png"
  },
  {
    "id": 77,
    "name": "World Cup",
    "localizedName": "FIFA World Cup",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/77.png"
  },
  {
    "id": 10358,
    "name": "World Cup Qualification (W) CONCAFAF",
    "localizedName": "World Cup Qualification (W) CONCAFAF",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10358.png"
  },
  {
    "id": 10359,
    "name": "World Cup Qualification (W) Inter-Confederation",
    "localizedName": "World Cup Qualification (W) Inter-Confederation",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10359.png"
  },
  {
    "id": 10357,
    "name": "World Cup Qualification (W) UEFA",
    "localizedName": "World Cup Qualification (W) UEFA",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10357.png"
  },
  {
    "id": 10197,
    "name": "World Cup Qualification AFC",
    "localizedName": "World Cup Qualification AFC",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10197.png"
  },
  {
    "id": 10196,
    "name": "World Cup Qualification CAF",
    "localizedName": "World Cup Qualification CAF",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10196.png"
  },
  {
    "id": 10198,
    "name": "World Cup Qualification CONCACAF",
    "localizedName": "World Cup Qualification CONCACAF",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10198.png"
  },
  {
    "id": 10199,
    "name": "World Cup Qualification CONMEBOL",
    "localizedName": "World Cup Qualification CONMEBOL",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10199.png"
  },
  {
    "id": 10201,
    "name": "World Cup Qualification Inter-confederation",
    "localizedName": "World Cup Qualification Inter-confederation",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10201.png"
  },
  {
    "id": 10200,
    "name": "World Cup Qualification OFC",
    "localizedName": "World Cup Qualification OFC",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10200.png"
  },
  {
    "id": 10195,
    "name": "World Cup Qualification UEFA",
    "localizedName": "World Cup Qualification UEFA",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/10195.png"
  },
  {
    "id": 306,
    "name": "World Cup U17",
    "localizedName": "World Cup U17",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/306.png"
  },
  {
    "id": 296,
    "name": "World Cup U20",
    "localizedName": "World Cup U20",
    "logo":
        "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/296.png"
  }
];

final List<Map<String, dynamic>> news = [
  {
    "id": "ftbpro_01jfsmx4v7m4",
    "imageUrl":
        "https://images2.minutemediacdn.com/image/upload/c_crop,w_1915,h_1077,x_0,y_0/c_fill,w_912,h_516,f_auto,q_auto,g_auto/images/voltaxMediaLibrary/mmsport/90min_en_international_web/01jfsph4p9nxp3xdwzvy.jpg",
    "title":
        "Gary Neville: Why Man Utd's crushing loss to Bournemouth is 'massive positive' for Ruben Amorim",
    "gmtTime": "2024-12-23T13:00:00.000Z",
    "sourceStr": "90min",
    "sourceIconUrl": null,
    "page": {
      "url":
          "/embed/news/01jfsmx4v7m4/gary-neville-why-man-utds-crushing-loss-bournemouth-is-massive-positive-ruben-amorim"
    }
  },
  {
    "id": "ftbpro_01jfsrbs4wca",
    "imageUrl":
        "https://images2.minutemediacdn.com/image/upload/c_crop,w_3000,h_1687,x_0,y_153/c_fill,w_912,h_516,f_auto,q_auto,g_auto/images/GettyImages/mmsport/90min_en_international_web/01jfsrjsjxw962dwp8xp.jpg",
    "title":
        "Former Man Utd coach explains why Erik ten Hag overlooked Amad Diallo",
    "gmtTime": "2024-12-23T13:30:00.000Z",
    "sourceStr": "90min",
    "sourceIconUrl": null,
    "page": {
      "url":
          "/embed/news/01jfsrbs4wca/former-man-utd-coach-explains-why-erik-ten-hag-overlooked-amad-diallo"
    }
  },
  {
    "id": "ftbpro_01jfsha0v0m9",
    "imageUrl":
        "https://images2.minutemediacdn.com/image/upload/c_crop,w_1707,h_960,x_0,y_189/c_fill,w_912,h_516,f_auto,q_auto,g_auto/images/GettyImages/mmsport/90min_en_international_web/01jfshh5s4f6yt5p6vrf.jpg",
    "title": "Mohamed Salah provides short update on Liverpool contract saga",
    "gmtTime": "2024-12-23T12:00:02.000Z",
    "sourceStr": "90min",
    "sourceIconUrl": null,
    "page": {
      "url":
          "/embed/news/01jfsha0v0m9/mohamed-salah-provides-short-update-liverpool-contract-saga"
    }
  },
  {
    "id": "ftbpro_01jfsehnv9gm",
    "imageUrl":
        "https://images2.minutemediacdn.com/image/upload/c_crop,w_4000,h_2250,x_0,y_129/c_fill,w_912,h_516,f_auto,q_auto,g_auto/images/GettyImages/mmsport/90min_en_international_web/01jfsfhwbtts6czr0wqw.jpg",
    "title": "Barcelona take drastic measure to register Dani Olmo",
    "gmtTime": "2024-12-23T11:00:00.000Z",
    "sourceStr": "90min",
    "sourceIconUrl": null,
    "page": {
      "url":
          "/embed/news/01jfsehnv9gm/barcelona-take-drastic-measure-register-dani-olmo"
    }
  },
  {
    "id": "ftbpro_01jfspgcwry8",
    "imageUrl":
        "https://images2.minutemediacdn.com/image/upload/c_crop,w_3500,h_1968,x_0,y_115/c_fill,w_912,h_516,f_auto,q_auto,g_auto/images/GettyImages/mmsport/90min_en_international_web/01jfsq08z80ncj2h2vf8.jpg",
    "title":
        "Arne Slot sounds Liverpool warning while reacting to Chelsea draw",
    "gmtTime": "2024-12-23T14:00:01.000Z",
    "sourceStr": "90min",
    "sourceIconUrl": null,
    "page": {
      "url":
          "/embed/news/01jfspgcwry8/arne-slot-sounds-liverpool-warning-while-reacting-chelsea-draw"
    }
  }
];
