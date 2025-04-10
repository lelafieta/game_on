import 'package:flutter/material.dart';

class OrganizerDetailsPage extends StatelessWidget {
  const OrganizerDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Número de abas
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  background: Stack(
                    fit: StackFit.passthrough,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        color: Colors.red,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://example.com/image.jpg',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text("data"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                bottom: const TabBar(
                  tabs: [
                    Tab(text: 'Details'),
                    Tab(text: 'Events'),
                    Tab(text: 'Reviews'),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              ListView(
                padding: const EdgeInsets.all(16.0),
                children: const [
                  SizedBox(height: 16),
                  Text(
                    'Organizer Description',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  Divider(height: 32),
                  // Adicione mais detalhes ou widgets aqui
                ],
              ),
              const Center(child: Text('Events Tab Content')),
              const Center(child: Text('Reviews Tab Content')),
            ],
          ),
        ),
      ),
    );
  }
}
