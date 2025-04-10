import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/themes/app_colors.dart';
import '../../../../core/resources/app_icons.dart';

class CompetitionDetailsPage extends StatefulWidget {
  const CompetitionDetailsPage({
    super.key,
  });

  @override
  State<CompetitionDetailsPage> createState() => _CompetitionDetailsPageState();
}

class _CompetitionDetailsPageState extends State<CompetitionDetailsPage> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                // title: Text(widget.campaign.title!),
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
                  decoration: const BoxDecoration(
                      // color: Theme.of(context).scaffoldBackgroundColor,
                      ),
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
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          CircularProgressIndicator(
                                              value: downloadProgress.progress),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              // color: Colors.red,
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
                                      // SvgPicture.asset(
                                      //   width: 16,
                                      //   AppIcons.shieldTrust,
                                      //   color: AppColors.blueColor,
                                      // ),
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
                            "Chat",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      OutlinedButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(AppColors.black),
                          minimumSize: const MaterialStatePropertyAll(
                            Size(45, 43),
                          ),
                          side: const MaterialStatePropertyAll(
                            BorderSide(
                              color: Colors.black12,
                              width: 2,
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: const Icon(
                          Icons.phone,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                ListTile(),
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
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 16),
                //   child: Text(
                //     "Sobre",
                //     style: Theme.of(context).textTheme.titleMedium!,
                //   ),
                // ),
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
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Competições",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: MasonryGridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: gridItems.length,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    padding: const EdgeInsets.only(top: 15),
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
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
                              ),
                              const SizedBox(height: 5),
                              Text(
                                gridItems[index]["description"]!,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Container(
                //   padding: const EdgeInsets.only(left: 16, right: 16),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         "Impactos feitos",
                //         style: Theme.of(context).textTheme.titleLarge,
                //       ),
                //       TextButton(onPressed: () {}, child: Text("Ver mais"))
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 150,
                //   child: ListView.separated(
                //     scrollDirection: Axis.horizontal,
                //     shrinkWrap: true,
                //     physics: const ClampingScrollPhysics(),
                //     padding: const EdgeInsets.symmetric(horizontal: 16),
                //     itemBuilder: (context, index) {
                //       return ClipRRect(
                //         borderRadius: BorderRadius.circular(5),
                //         child: Stack(
                //           children: [
                //             Container(
                //               width: 150,
                //               decoration: BoxDecoration(
                //                 color: Colors.red,
                //                 borderRadius: BorderRadius.circular(5),
                //               ),
                //             ),
                //             Positioned(
                //               left: 0,
                //               right: 0,
                //               top: 0,
                //               bottom: 0,
                //               child: Image.asset(
                //                 AppImages.wave,
                //                 fit: BoxFit.cover,
                //               ),
                //             ),
                //             Positioned(
                //               left: 0,
                //               right: 0,
                //               top: 0,
                //               bottom: 0,
                //               child: Container(
                //                 color: Colors.black26,
                //               ),
                //             ),
                //             Positioned(
                //               left: 0,
                //               right: 0,
                //               bottom: 0,
                //               child: Container(
                //                 height: 55,
                //                 decoration: const BoxDecoration(
                //                   gradient: LinearGradient(
                //                     begin: Alignment.topCenter,
                //                     end: Alignment.bottomCenter,
                //                     colors: [
                //                       Colors.transparent,
                //                       Colors.black,
                //                     ],
                //                   ),
                //                 ),
                //                 child: const Padding(
                //                   padding: EdgeInsets.all(8.0),
                //                   child: Column(
                //                     crossAxisAlignment:
                //                         CrossAxisAlignment.start,
                //                     children: [
                //                       Text(
                //                         "Covid Test",
                //                         style: TextStyle(
                //                           color: Colors.white,
                //                           overflow: TextOverflow.ellipsis,
                //                         ),
                //                       ),
                //                       Text(
                //                         "11 Agosto 2025",
                //                         style: TextStyle(
                //                           color: Colors.white70,
                //                           overflow: TextOverflow.ellipsis,
                //                           fontSize: 10,
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ],
                //         ),
                //       );
                //     },
                //     separatorBuilder: (context, index) {
                //       return const SizedBox(width: 10);
                //     },
                //     itemCount: 15,
                //   ),
                // ),
                // Container(
                //   width: double.infinity,
                //   height: 45,
                //   decoration: BoxDecoration(
                //       // border: Border(
                //       //   bottom: BorderSide(
                //       //     width: 2,
                //       //     color: Colors.black12,
                //       //   ),
                //       // ),
                //       ),
                //   child: ListView.separated(
                //     physics: const ClampingScrollPhysics(),
                //     shrinkWrap: true,
                //     scrollDirection: Axis.horizontal,
                //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
                //     itemBuilder: (context, index) {
                //       return InkWell(
                //         onTap: () {
                //           setState(() {
                //             selected = index;
                //           });
                //         },
                //         child: Container(
                //           padding: const EdgeInsets.symmetric(
                //             horizontal: 16,
                //           ),
                //           decoration: BoxDecoration(
                //             border: (index == selected)
                //                 ? const Border(
                //                     bottom: BorderSide(
                //                       width: 2,
                //                       color: Colors.black,
                //                     ),
                //                   )
                //                 : Border.all(
                //                     width: 0, color: Colors.transparent),
                //           ),
                //           child: Center(
                //             child: Text(
                //               menuList[index].toString(),
                //               style: (index != selected)
                //                   ? Theme.of(context).textTheme.bodyMedium
                //                   : Theme.of(context)
                //                       .textTheme
                //                       .bodyMedium!
                //                       .copyWith(
                //                           fontWeight: FontWeight.bold,
                //                           color: Colors.black),
                //             ),
                //           ),
                //         ),
                //       );
                //     },
                //     separatorBuilder: (context, index) {
                //       return const SizedBox(
                //         width: 10,
                //       );
                //     },
                //     itemCount: menuList.length,
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
