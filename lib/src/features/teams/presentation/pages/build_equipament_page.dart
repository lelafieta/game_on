import 'package:flutter/material.dart';

import '../../../../config/themes/app_colors.dart';
import '../../../../core/resources/app_images.dart';

class BuildEquipamentPage extends StatefulWidget {
  const BuildEquipamentPage({super.key});

  @override
  State<BuildEquipamentPage> createState() => _BuildEquipamentPageState();
}

class _BuildEquipamentPageState extends State<BuildEquipamentPage> {
  final ValueNotifier<String?> selectedType =
      ValueNotifier<String?>("treeBarras");
  final ValueNotifier<Color> selectedMainShirtColor =
      ValueNotifier<Color>(Colors.red);
  final ValueNotifier<Color> selectedStyleShirtColor =
      ValueNotifier<Color>(Colors.blue);

  final Map<String, String> typeToImage = {
    'type1': AppImages.type1,
    'type2': AppImages.type2,
    'type3': AppImages.type3,
    'type4': AppImages.type4,
    'type5': AppImages.type5,
    'type6': AppImages.type6,
    'type7': AppImages.type7,
    'type8': AppImages.type8,
    'type9': AppImages.type9,
    'type10': AppImages.type10,
    'type11': AppImages.type11,
    'type12': AppImages.type12,
    'type13': AppImages.type13,
    'type14': AppImages.type14,
    'type15': AppImages.type15,
    'type16': AppImages.type16,
    'type17': AppImages.type17,
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

  late TabController _tabController;
  final int totalPartidas = 6;
  final ValueNotifier<int> partidaAtual = ValueNotifier<int>(3);

  final String backgroundUrl =
      'https://scontent.flad5-1.fna.fbcdn.net/v/t39.30808-6/481972096_1207928134015658_4427683262273356979_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=cc71e4&_nc_ohc=zV_8X74IuyoQ7kNvwFNQ4ob&_nc_oc=AdkuSLXzaRPCkaG4Rk49w94sTBmd8Fhxnz2QazxYg2iIpuENHNFuCjDX0VJn-DIsKu_tpPTIOY-QLCN9VE_o77Vv&_nc_zt=23&_nc_ht=scontent.flad5-1.fna&_nc_gid=6g5SEc_mHR1ryf38jcOikw&oh=00_AfHwiN08xuDHuwgUxbjxBUvvfo7y6kwFlL6d0wj-XXV6kA&oe=68047308';
  final String profileUrl =
      'https://scontent.flad5-1.fna.fbcdn.net/v/t39.30808-6/468946321_1143394810468991_6731165110528390324_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=wSrOeJxvDDEQ7kNvwEbvT6L&_nc_oc=AdlTqHYlCPFGfrAGQlDwBDoWGWHzOtYBQvPLz5DFEahZRV2c0WoBBuSIrcQrBKYO_91fpJuk6Y9c1v6oU_Uldije&_nc_zt=23&_nc_ht=scontent.flad5-1.fna&_nc_gid=bu1cwd0CKmhmqZJFsKvxIg&oh=00_AfHS3wRkCA00310Cb6BF1t2f-b46KjsWZzhIrcgxTejGig&oe=68048141';
  final String team1Logo =
      'https://scontent.flad5-1.fna.fbcdn.net/v/t39.30808-1/449761244_1062646795218211_4139834764378388664_n.jpg?stp=c196.196.1199.1199a_dst-jpg_s200x200_tt6&_nc_cat=1&ccb=1-7&_nc_sid=2d3e12&_nc_ohc=2PIv9d0zbT4Q7kNvwFrDdyl&_nc_oc=Adnbea-uBG6-Yjz-swaIok52lxeGLlxbFYlST90cK4dm1KdQveMu-MleJfCBBy4zbgL6PbCyY77uA-Jx-87CXmsf&_nc_zt=24&_nc_ht=scontent.flad5-1.fna&_nc_gid=b_6-6aTZFayQsgqhCcyxhQ&oh=00_AfE78XoqOuYLsaL3vLfGnPlltyuw8ZA_dK-vkLTcnXYkEA&oe=68047744';
  final String team2Logo =
      'https://scontent.flad5-1.fna.fbcdn.net/v/t39.30808-1/273144602_10152602977424953_1955203260619408476_n.jpg?stp=dst-jpg_s200x200_tt6&_nc_cat=1&ccb=1-7&_nc_sid=2d3e12&_nc_ohc=q-W_7Ofx0GIQ7kNvwGEJVrU&_nc_oc=Adnh-RBMtZE6Kr9ubdATmRiKH6NAEiVO92HwxQXcJXb10vyt6hqv1nhkO14Pimi4X05KqocWeD2Q83HP7vsW3Xw6&_nc_zt=24&_nc_ht=scontent.flad5-1.fna&_nc_gid=tINtmFSQ5O2qx6UrzJ1Xjg&oh=00_AfFWaHkb26Gz6qnHdeiku917wrHIZY8eRqAgYFACd31o-Q&oe=68047B4B';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                width: 250,
                height: 300,
                child: Stack(
                  children: [
                    ValueListenableBuilder<Color>(
                      valueListenable: selectedMainShirtColor,
                      builder: (_, color, __) {
                        return Image.asset(
                          AppImages.freeTShirt,
                          color: color,
                        );
                      },
                    ),
                    ValueListenableBuilder(
                        valueListenable: selectedStyleShirtColor,
                        builder: (___, color, ____) {
                          return ValueListenableBuilder<String?>(
                            valueListenable: selectedType,
                            builder: (_, type, __) {
                              if (type == null) return SizedBox.shrink();
                              return Positioned(
                                left: 0,
                                right: 0,
                                top: 0,
                                child: Image.asset(
                                  typeToImage[type]!,
                                  color: color,
                                ),
                              );
                            },
                          );
                        }),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Wrap(
              spacing: 8,
              children: typeToImage.entries.map((entry) {
                final imagePath = entry.value;
                return InkWell(
                  onTap: () {
                    selectedType.value = entry.key;
                  },
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        top: 0,
                        child: Image.asset(
                          AppImages.freeTShirt,
                          color: Colors.black,
                        ),
                      ),
                      ValueListenableBuilder(
                          valueListenable: selectedType,
                          builder: (_, selected, __) {
                            return (selected == entry.key)
                                ? Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                      child: Icon(
                                        Icons.check_circle,
                                        color: Colors.blue.shade900,
                                        size: 15,
                                      ),
                                    ),
                                  )
                                : const SizedBox.shrink();
                          }),
                      Image.asset(
                        imagePath,
                        width: 50,
                        height: 50,
                        color: Colors.white,
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ValueListenableBuilder(
                valueListenable: selectedMainShirtColor,
                builder: (_, theColor, __) {
                  return Wrap(
                    spacing: 8,
                    children: colors.map((color) {
                      return GestureDetector(
                        onTap: () {
                          selectedMainShirtColor.value = color;
                        },
                        child: Stack(
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: color,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: theColor == color
                                      ? Colors.black
                                      : Colors.transparent,
                                  width: 2,
                                ),
                              ),
                            ),
                            (theColor == color)
                                ? const Positioned(
                                    left: 0,
                                    right: 0,
                                    top: 0,
                                    bottom: 0,
                                    child: Icon(
                                      Icons.check_circle,
                                      color: Colors.black,
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ],
                        ),
                      );
                    }).toList(),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ValueListenableBuilder(
                valueListenable: selectedStyleShirtColor,
                builder: (_, theColor, __) {
                  return Wrap(
                    spacing: 8,
                    children: colors.map((color) {
                      return GestureDetector(
                        onTap: () {
                          selectedStyleShirtColor.value = color;
                        },
                        child: Stack(
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: color,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: theColor == color
                                      ? Colors.black
                                      : Colors.transparent,
                                  width: 2,
                                ),
                              ),
                            ),
                            (theColor == color)
                                ? const Positioned(
                                    left: 0,
                                    right: 0,
                                    top: 0,
                                    bottom: 0,
                                    child: Icon(
                                      Icons.check_circle,
                                      color: Colors.black,
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ],
                        ),
                      );
                    }).toList(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
