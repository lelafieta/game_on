// import 'dart:ui';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:sliver_snap/widgets/sliver_snap.dart';

// import '../../../../config/routes/app_routes.dart';
// import '../../../../config/themes/app_colors.dart';
// import '../../../../core/resources/app_icons.dart';
// import '../../../../core/resources/app_images.dart';

// class OrganizerDetailsPage extends StatefulWidget {
//   const OrganizerDetailsPage({
//     super.key,
//   });

//   @override
//   State<OrganizerDetailsPage> createState() => _OrganizerDetailsPageState();
// }

// class _OrganizerDetailsPageState extends State<OrganizerDetailsPage> {
//   List<String> menuList = ["Recentes", "Campanhas", "Eventos", "Blogs"];
//   int selected = 0;

//   final List<Map<String, String>> gridItems = [
//     {
//       "title": "Champions das Duplas 2023",
//       "description": "Minha visão",
//     },
//     {
//       "title": "Torneio Nacional",
//       "description": "Minha missão",
//     },
//     {
//       "title": "Workshop de Liderança",
//       "description": "Capacitação de líderes",
//     },
//     {
//       "title": "Evento de Caridade",
//       "description": "Ajudando comunidades",
//     },
//     {
//       "title": "Campeonato Regional",
//       "description": "Unindo talentos locais",
//     },
//     {
//       "title": "Palestra Motivacional",
//       "description": "Inspiração para jovens",
//     },
//   ];
//   @override
//   Widget build(BuildContext context) {

//     return SliverSnap(
//       onCollapseStateChanged: (isCollapsed, scrollingOffset, maxExtent) {},
//       collapsedBackgroundColor: Colors.black,
//       expandedBackgroundColor: Colors.transparent,
//       backdropWidget: Stack(
//         children: [
//           Image.network(
//             "https://storage.boxoutsports.com/template_categories/24/templates/563110/9eb93cff-6904-4caf-9871-8852e4e9dd30.jpg",
//             fit: BoxFit.cover,
//           ),
//           Positioned(
//             left: 0,
//             top: 0,
//             right: 0,
//             bottom: 0,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Theme.of(context).scaffoldBackgroundColor,
//                 backgroundBlendMode: BlendMode.darken,
//               ),
//               child: BackdropFilter(
//                 filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//                 child: Container(
//                     // color: Colors.black87.withOpacity(0.2),
//                     ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       bottom: const PreferredSize(
//         preferredSize: Size.fromHeight(50),
//         child: Icon(
//           Icons.directions_boat,
//           color: Colors.blue,
//           size: 45,
//         ),
//       ),
//       expandedContentHeight: 350,
//       expandedContent: SafeArea(
//         child: Center(
//           child: Column(
//             children: [
//               const SizedBox(height: 20),
//               Container(
//                 width: 100,
//                 height: 100,
//                 decoration: BoxDecoration(
//                   // color: Colors.amber,
//                   // border: Border.all(color: Colors.white),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 clipBehavior: Clip.hardEdge,
//                 child: CachedNetworkImage(
//                   width: 100,
//                   height: 100,
//                   imageUrl:
//                       "https://storage.boxoutsports.com/template_categories/24/templates/563110/9eb93cff-6904-4caf-9871-8852e4e9dd30.jpg",
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 "Fieta Organization",
//                 style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                       fontWeight: FontWeight.bold,
//                       color: AppColors.black,
//                     ),
//               ),
//               Text(
//                 "Aqui vai uma descrição sobre o Campeonato",
//                 // style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                 //       fontWeight: FontWeight.bold,
//                 //       color: AppColors.black,
//                 //     ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       collapsedContent:
//           const Icon(Icons.car_crash, color: Colors.green, size: 45),
//       body: const Material(
//         elevation: 7,
//         child: Placeholder(),
//       ),
//     );

//     return Scaffold(
//       body: NestedScrollView(
//         headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//           if (innerBoxIsScrolled) {}
//           return [
//             SliverAppBar(
//               expandedHeight: 250.0,
//               floating: false,
//               pinned: true,
//               leading: IconButton(
//                 onPressed: () {},
//                 icon: Icon(
//                   Icons.arrow_back,
//                   color: Colors.white,
//                 ),
//               ),
//               actions: [
//                 IconButton(
//                   onPressed: () {},
//                   icon: Icon(
//                     Icons.share,
//                     color: Colors.white,
//                   ),
//                 ),
//               ],
//               flexibleSpace: FlexibleSpaceBar(
//                 // title: Text(widget.campaign.title!),
//                 background: Stack(
//                   children: [
//                     SizedBox(
//                       width: double.infinity,
//                       height: double.infinity,
//                       child: CachedNetworkImage(
//                         imageUrl:
//                             "https://scontent.flad5-1.fna.fbcdn.net/v/t39.30808-6/393362262_295776626562301_407325209243642260_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=Ic8klsng5fwQ7kNvwHzz7Nf&_nc_oc=AdnfpQl6hbBQJYG8NDxfcltgT7wZ2nUGUigL3r7qNjmpj0Zf6MEkoTUMmUzVAJuxd5kEjIE0QOLsAaVv8y2WJx_I&_nc_zt=23&_nc_ht=scontent.flad5-1.fna&_nc_gid=zJ3PK8hA85pmF3pUjOPzWw&oh=00_AfHAR3go9D1FnCrF0S0MbAOvYO4fz_Utmyp8lJAfmIuLAg&oe=67FCAEB5",
//                         fit: BoxFit.cover,
//                         progressIndicatorBuilder:
//                             (context, url, downloadProgress) =>
//                                 CircularProgressIndicator(
//                                     value: downloadProgress.progress),
//                         errorWidget: (context, url, error) =>
//                             const Icon(Icons.error),
//                       ),
//                     ),
//                     Positioned(
//                       left: 0,
//                       right: 0,
//                       bottom: 0,
//                       top: 0,
//                       child: Container(
//                         color: Colors.black26,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               bottom: PreferredSize(
//                 preferredSize: const Size.fromHeight(150.0),
//                 child: Container(
//                   width: double.infinity,
//                   decoration: const BoxDecoration(
//                       // color: Theme.of(context).scaffoldBackgroundColor,
//                       ),
//                   child: Stack(
//                     children: [
//                       Positioned(
//                         bottom: 0,
//                         left: 0,
//                         right: 0,
//                         child: Container(
//                           width: double.infinity,
//                           height: 120,
//                           color: Theme.of(context).scaffoldBackgroundColor,
//                         ),
//                       ),
//                       Positioned(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               width: 100,
//                               height: 100,
//                               decoration: BoxDecoration(
//                                 color: Colors.green,
//                                 borderRadius: BorderRadius.circular(50),
//                                 border: Border.all(
//                                     width: 5,
//                                     color: Theme.of(context)
//                                         .scaffoldBackgroundColor),
//                               ),
//                               margin: const EdgeInsets.only(left: 16),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(50),
//                                 child: CachedNetworkImage(
//                                   imageUrl:
//                                       "https://scontent.flad5-1.fna.fbcdn.net/v/t39.30808-6/393362262_295776626562301_407325209243642260_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=Ic8klsng5fwQ7kNvwHzz7Nf&_nc_oc=AdnfpQl6hbBQJYG8NDxfcltgT7wZ2nUGUigL3r7qNjmpj0Zf6MEkoTUMmUzVAJuxd5kEjIE0QOLsAaVv8y2WJx_I&_nc_zt=23&_nc_ht=scontent.flad5-1.fna&_nc_gid=zJ3PK8hA85pmF3pUjOPzWw&oh=00_AfHAR3go9D1FnCrF0S0MbAOvYO4fz_Utmyp8lJAfmIuLAg&oe=67FCAEB5",
//                                   fit: BoxFit.cover,
//                                   progressIndicatorBuilder:
//                                       (context, url, downloadProgress) =>
//                                           CircularProgressIndicator(
//                                               value: downloadProgress.progress),
//                                   errorWidget: (context, url, error) =>
//                                       const Icon(Icons.error),
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               width: double.infinity,
//                               // color: Colors.red,
//                               height: 70,
//                               padding: EdgeInsets.symmetric(horizontal: 16),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Text(
//                                         "Fieta Organization",
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .titleMedium!
//                                             .copyWith(
//                                               fontWeight: FontWeight.bold,
//                                               color: AppColors.black,
//                                             ),
//                                       ),
//                                       const SizedBox(width: 5),
//                                       // SvgPicture.asset(
//                                       //   width: 16,
//                                       //   AppIcons.shieldTrust,
//                                       //   color: AppColors.blueColor,
//                                       // ),
//                                     ],
//                                   ),
//                                   const SizedBox(height: 5),
//                                   const Text("Aqui vai uma breve descrição"),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ];
//         },
//         body: Container(
//           decoration: BoxDecoration(
//             color: Theme.of(context).scaffoldBackgroundColor,
//           ),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Padding(
//                   padding: EdgeInsets.all(16.0),
//                   child: Row(
//                     children: [
//                       Text(
//                         "1.000",
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(width: 8),
//                       Text(
//                         "Competições",
//                         style: TextStyle(color: Colors.black),
//                       ),
//                       SizedBox(width: 10),
//                       Text(
//                         "|",
//                         style: TextStyle(
//                             color: Colors.black, fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(width: 10),
//                       Text(
//                         "230",
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(width: 8),
//                       Text(
//                         "Seguidores",
//                         style: TextStyle(color: Colors.black),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: OutlinedButton(
//                           style: ButtonStyle(
//                             foregroundColor:
//                                 MaterialStateProperty.all(AppColors.white),
//                             backgroundColor:
//                                 MaterialStateProperty.all(AppColors.primary),
//                             side: const MaterialStatePropertyAll(
//                               BorderSide(
//                                 color: AppColors.primary,
//                               ),
//                             ),
//                           ),
//                           onPressed: () {},
//                           child: const Text(
//                             "Seguir",
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 10),
//                       Expanded(
//                         child: OutlinedButton(
//                           style: ButtonStyle(
//                             foregroundColor:
//                                 MaterialStateProperty.all(AppColors.black),
//                             side: const MaterialStatePropertyAll(
//                               BorderSide(
//                                 color: Colors.black12,
//                                 width: 2,
//                               ),
//                             ),
//                           ),
//                           onPressed: () {},
//                           child: const Text(
//                             "Chat",
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 10),
//                       OutlinedButton(
//                         style: ButtonStyle(
//                           foregroundColor:
//                               MaterialStateProperty.all(AppColors.black),
//                           minimumSize: const MaterialStatePropertyAll(
//                             Size(45, 43),
//                           ),
//                           side: const MaterialStatePropertyAll(
//                             BorderSide(
//                               color: Colors.black12,
//                               width: 2,
//                             ),
//                           ),
//                         ),
//                         onPressed: () {},
//                         child: const Icon(
//                           Icons.phone,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       IconButton(
//                         onPressed: () async {},
//                         icon: SvgPicture.asset(
//                           AppIcons.link,
//                           width: 25,
//                           height: 25,
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       IconButton(
//                         onPressed: () async {},
//                         icon: SvgPicture.asset(
//                           AppIcons.whatsapp,
//                           width: 30,
//                           height: 30,
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       IconButton(
//                         onPressed: () async {},
//                         icon: SvgPicture.asset(
//                           AppIcons.facebook,
//                           width: 30,
//                           height: 30,
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       IconButton(
//                         onPressed: () async {},
//                         icon: SvgPicture.asset(
//                           AppIcons.instagram,
//                           width: 30,
//                           height: 30,
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       IconButton(
//                         onPressed: () async {},
//                         icon: SvgPicture.asset(
//                           AppIcons.x,
//                           width: 30,
//                           height: 30,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 // Padding(
//                 //   padding: const EdgeInsets.symmetric(horizontal: 16),
//                 //   child: Text(
//                 //     "Sobre",
//                 //     style: Theme.of(context).textTheme.titleMedium!,
//                 //   ),
//                 // ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: Row(
//                     children: [
//                       SvgPicture.asset(
//                         width: 30,
//                         AppIcons.flagAngola,
//                       ),
//                       const SizedBox(width: 10),
//                       const Text("Angola, Luanda, Kikolo"),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: Text(
//                     "Competições",
//                     style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                           fontWeight: FontWeight.bold,
//                           color: AppColors.black,
//                         ),
//                   ),
//                 ),

//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: MasonryGridView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     gridDelegate:
//                         const SliverSimpleGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                     ),
//                     itemCount: gridItems.length,
//                     mainAxisSpacing: 10,
//                     crossAxisSpacing: 10,
//                     padding: const EdgeInsets.only(top: 15),
//                     itemBuilder: (context, index) {
//                       return InkWell(
//                         onTap: () {
//                           Navigator.pushNamed(
//                             context,
//                             AppRoutes.competionDetails,
//                             arguments: gridItems[index],
//                           );
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(10),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black.withOpacity(0.09),
//                                 blurRadius: 12,
//                                 offset: const Offset(0, 4),
//                               ),
//                             ],
//                           ),
//                           child: Container(
//                             padding: const EdgeInsets.all(10),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   width: 60,
//                                   height: 60,
//                                   padding: const EdgeInsets.all(5),
//                                   decoration: BoxDecoration(
//                                     color: AppColors.primary,
//                                     borderRadius: BorderRadius.circular(50),
//                                   ),
//                                   // Add your icon here
//                                   // child: SvgPicture.asset(
//                                   //   AppIcons.lightbulbOn,
//                                   //   color: Colors.white,
//                                   // ),
//                                 ),
//                                 const SizedBox(height: 5),
//                                 Text(
//                                   gridItems[index]["title"]!,
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .titleSmall!
//                                       .copyWith(fontWeight: FontWeight.bold),
//                                 ),
//                                 const SizedBox(height: 5),
//                                 Text(
//                                   gridItems[index]["description"]!,
//                                   maxLines: 3,
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),

//                 // Container(
//                 //   padding: const EdgeInsets.only(left: 16, right: 16),
//                 //   child: Row(
//                 //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 //     children: [
//                 //       Text(
//                 //         "Impactos feitos",
//                 //         style: Theme.of(context).textTheme.titleLarge,
//                 //       ),
//                 //       TextButton(onPressed: () {}, child: Text("Ver mais"))
//                 //     ],
//                 //   ),
//                 // ),
//                 // SizedBox(
//                 //   height: 150,
//                 //   child: ListView.separated(
//                 //     scrollDirection: Axis.horizontal,
//                 //     shrinkWrap: true,
//                 //     physics: const ClampingScrollPhysics(),
//                 //     padding: const EdgeInsets.symmetric(horizontal: 16),
//                 //     itemBuilder: (context, index) {
//                 //       return ClipRRect(
//                 //         borderRadius: BorderRadius.circular(5),
//                 //         child: Stack(
//                 //           children: [
//                 //             Container(
//                 //               width: 150,
//                 //               decoration: BoxDecoration(
//                 //                 color: Colors.red,
//                 //                 borderRadius: BorderRadius.circular(5),
//                 //               ),
//                 //             ),
//                 //             Positioned(
//                 //               left: 0,
//                 //               right: 0,
//                 //               top: 0,
//                 //               bottom: 0,
//                 //               child: Image.asset(
//                 //                 AppImages.wave,
//                 //                 fit: BoxFit.cover,
//                 //               ),
//                 //             ),
//                 //             Positioned(
//                 //               left: 0,
//                 //               right: 0,
//                 //               top: 0,
//                 //               bottom: 0,
//                 //               child: Container(
//                 //                 color: Colors.black26,
//                 //               ),
//                 //             ),
//                 //             Positioned(
//                 //               left: 0,
//                 //               right: 0,
//                 //               bottom: 0,
//                 //               child: Container(
//                 //                 height: 55,
//                 //                 decoration: const BoxDecoration(
//                 //                   gradient: LinearGradient(
//                 //                     begin: Alignment.topCenter,
//                 //                     end: Alignment.bottomCenter,
//                 //                     colors: [
//                 //                       Colors.transparent,
//                 //                       Colors.black,
//                 //                     ],
//                 //                   ),
//                 //                 ),
//                 //                 child: const Padding(
//                 //                   padding: EdgeInsets.all(8.0),
//                 //                   child: Column(
//                 //                     crossAxisAlignment:
//                 //                         CrossAxisAlignment.start,
//                 //                     children: [
//                 //                       Text(
//                 //                         "Covid Test",
//                 //                         style: TextStyle(
//                 //                           color: Colors.white,
//                 //                           overflow: TextOverflow.ellipsis,
//                 //                         ),
//                 //                       ),
//                 //                       Text(
//                 //                         "11 Agosto 2025",
//                 //                         style: TextStyle(
//                 //                           color: Colors.white70,
//                 //                           overflow: TextOverflow.ellipsis,
//                 //                           fontSize: 10,
//                 //                         ),
//                 //                       ),
//                 //                     ],
//                 //                   ),
//                 //                 ),
//                 //               ),
//                 //             ),
//                 //           ],
//                 //         ),
//                 //       );
//                 //     },
//                 //     separatorBuilder: (context, index) {
//                 //       return const SizedBox(width: 10);
//                 //     },
//                 //     itemCount: 15,
//                 //   ),
//                 // ),
//                 // Container(
//                 //   width: double.infinity,
//                 //   height: 45,
//                 //   decoration: BoxDecoration(
//                 //       // border: Border(
//                 //       //   bottom: BorderSide(
//                 //       //     width: 2,
//                 //       //     color: Colors.black12,
//                 //       //   ),
//                 //       // ),
//                 //       ),
//                 //   child: ListView.separated(
//                 //     physics: const ClampingScrollPhysics(),
//                 //     shrinkWrap: true,
//                 //     scrollDirection: Axis.horizontal,
//                 //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 //     itemBuilder: (context, index) {
//                 //       return InkWell(
//                 //         onTap: () {
//                 //           setState(() {
//                 //             selected = index;
//                 //           });
//                 //         },
//                 //         child: Container(
//                 //           padding: const EdgeInsets.symmetric(
//                 //             horizontal: 16,
//                 //           ),
//                 //           decoration: BoxDecoration(
//                 //             border: (index == selected)
//                 //                 ? const Border(
//                 //                     bottom: BorderSide(
//                 //                       width: 2,
//                 //                       color: Colors.black,
//                 //                     ),
//                 //                   )
//                 //                 : Border.all(
//                 //                     width: 0, color: Colors.transparent),
//                 //           ),
//                 //           child: Center(
//                 //             child: Text(
//                 //               menuList[index].toString(),
//                 //               style: (index != selected)
//                 //                   ? Theme.of(context).textTheme.bodyMedium
//                 //                   : Theme.of(context)
//                 //                       .textTheme
//                 //                       .bodyMedium!
//                 //                       .copyWith(
//                 //                           fontWeight: FontWeight.bold,
//                 //                           color: Colors.black),
//                 //             ),
//                 //           ),
//                 //         ),
//                 //       );
//                 //     },
//                 //     separatorBuilder: (context, index) {
//                 //       return const SizedBox(
//                 //         width: 10,
//                 //       );
//                 //     },
//                 //     itemCount: menuList.length,
//                 //   ),
//                 // ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:game_on/src/core/strings/app_strings.dart';
import 'package:game_on/src/secrets/app_secrets.dart';

import '../../../../config/themes/app_colors.dart';

class OrganizerDetailsPage extends StatefulWidget {
  const OrganizerDetailsPage({super.key});

  @override
  State<OrganizerDetailsPage> createState() => _OrganizerDetailsPageState();
}

class _OrganizerDetailsPageState extends State<OrganizerDetailsPage> {
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
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
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
                      left: 16,
                      top: 10,
                      child: SafeArea(
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            padding: const EdgeInsets.all(8.0),
                            icon: const Icon(
                              Icons.arrow_back,
                              color: AppColors.black,
                            ),
                            onPressed: () {
                              // Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: -60, // ajustado para acomodar o tamanho maior
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 70, // aumentado o tamanho do círculo
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 66, // aumentado o tamanho da imagem
                              backgroundImage: NetworkImage(profileUrl),
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
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Icon(Icons.verified,
                                  color: Colors.blue, size: 22),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 70), // ajustado para o novo tamanho do escudo
                // Nome do time + selo de verificação
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Text(
                        'Fieta Organizador',
                        style: TextStyle(
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
                SizedBox(height: 4),
                // Informações adicionais
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: AppStrings.fontFamily,
                    ),
                    children: [
                      TextSpan(
                        text: '3,1 M',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' Torneios • ',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      TextSpan(
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
              children: const [
                Icon(Icons.location_on, color: Colors.grey),
                SizedBox(width: 5),
                Text("Angola, Luanda, Benfica"),
              ],
            ),
            const SizedBox(height: 10),
            const TabBar(
              labelColor: Color(0xFF04764E),
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: 'Overview'),
                Tab(text: 'Table'),
                Tab(text: 'Squad'),
                Tab(text: 'Matches'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildOverview(team1Logo, team2Logo),
                  const Center(child: Text('Table Content')),
                  const Center(child: Text('Squad Content')),
                  const Center(child: Text('Matches Content')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOverview(String team1, String team2) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Next match',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[200],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildTeamColumn(team1, 'Juventus'),
                  const Column(
                    children: [
                      Text('07:30',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('10 DEC'),
                      Text('Emirates stadium', style: TextStyle(fontSize: 10)),
                    ],
                  ),
                  _buildTeamColumn(team2, 'PSG'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Previous Games',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text('4:0'),
                Text('0:5'),
                Text('5:2'),
                Text('1:1'),
                Text('3:1'),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Point Table',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DataTable(columns: const [
              DataColumn(label: Text('Pos')),
              DataColumn(label: Text('EAST')),
              DataColumn(label: Text('P')),
              DataColumn(label: Text('Goals')),
              DataColumn(label: Text('GD')),
              DataColumn(label: Text('Pts')),
            ], rows: const [
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('PSG')),
                DataCell(Text('4')),
                DataCell(Text('18:4')),
                DataCell(Text('14')),
                DataCell(Text('10')),
              ])
            ])
          ],
        ),
      ),
    );
  }

  Widget _buildTeamColumn(String imageUrl, String name) {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: imageUrl,
          height: 40,
          width: 40,
        ),
        const SizedBox(height: 5),
        Text(name),
      ],
    );
  }
}
