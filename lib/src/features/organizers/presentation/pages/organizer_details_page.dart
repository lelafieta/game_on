import 'package:flutter/material.dart';
import 'package:sliver_app_bar_builder/sliver_app_bar_builder.dart';

import '../../../../config/themes/app_colors.dart';

class OrganizerDetailsPage extends StatelessWidget {
  const OrganizerDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Número de abas
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBarBuilder(
              barHeight: 60,
              pinned: true,
              floating: false,
              backgroundColorAll: Colors.white,
              leadingActions: [
                (context, expandRatio, barHeight, overlapsContent) {
                  return SizedBox(
                    height: barHeight,
                    child: const BackButton(),
                  );
                }
              ],
              initialContentHeight: 150,
              contentBuilder: (context, expandRatio, contentHeight,
                  overlapsContent, barHeight) {
                return Container(
                  alignment: Alignment.centerLeft,
                  height: 60,
                  transform: Matrix4.translationValues(
                      10 + (1 - expandRatio) * 40, 0, 0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30 + expandRatio * 20,
                        backgroundImage:
                            const NetworkImage('https://example.com/image.jpg'),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'My Title',
                        style: TextStyle(
                          fontSize: 22 + expandRatio * 10,
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: _SliverAppBarDelegate(
                const TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(text: 'Tab 1'),
                    Tab(text: 'Tab 2'),
                    Tab(text: 'Tab 3'),
                  ],
                ),
              ),
            ),
            const SliverFillRemaining(
              child: TabBarView(
                children: [
                  Center(child: Text('Content for Tab 1')),
                  Center(child: Text('Content for Tab 2')),
                  Center(child: Text('Content for Tab 3')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _SliverAppBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
