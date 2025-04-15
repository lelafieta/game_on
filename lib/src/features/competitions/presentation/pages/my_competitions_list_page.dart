import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../config/themes/app_colors.dart';
import '../../../../core/strings/app_strings.dart';

class MyCompetitionsListPage extends StatelessWidget {
  const MyCompetitionsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
            color: AppColors.primary,
            child: SafeArea(
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      padding: const EdgeInsets.all(8.0),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.white,
                      ),
                      onPressed: () {
                        // Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Meus Torneios",
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      padding: const EdgeInsets.all(8.0),
                      icon: const Icon(
                        Icons.add,
                        color: AppColors.primary,
                      ),
                      onPressed: () {
                        // Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: DefaultTabController(
              length: 4,
              child: Column(
                children: [
                  Container(
                    color: AppColors.primary,
                    child: TabBar(
                      labelColor: AppColors.white,
                      unselectedLabelColor: Colors.white60,
                      indicatorColor: AppColors.white,
                      isScrollable: true,
                      padding: EdgeInsets.zero,
                      tabAlignment: TabAlignment.center,
                      tabs: const [
                        Tab(text: "Todos"),
                        Tab(text: "Pendentes"),
                        Tab(text: "Rascunho"),
                        Tab(text: "Terminados"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        _buildAllCompetitions(),
                        Center(child: Text("Torneios ativos")),
                        Center(child: Text("Torneios encerrados")),
                        Center(child: Text("Torneios favoritos")),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAllCompetitions() {
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: 10, // Replace with the actual number of competitions
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    "https://fpfimagehandler.fpf.pt/FPFImageHandler.ashx?type=Person&id=3883014&op=t&w=325&h=378",
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  'Brinca na Areia',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          width: 20,
                          height: 20,
                          child: CachedNetworkImage(
                              imageUrl:
                                  "https://fpfimagehandler.fpf.pt/FPFImageHandler.ashx?type=Person&id=3883014&op=t&w=325&h=378"),
                        ),
                      ),
                      Text("Real Madrid"),
                    ],
                  ),
                ),
                trailing: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "20 ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: AppStrings.fontFamily),
                      ),
                      TextSpan(
                        text: "Gol.",
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: AppStrings.fontFamily),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                "Competição ${index + 1}", // Replace with competition name
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                "Localização: Cidade XYZ", // Replace with competition location
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
              Text(
                "Estado: ${index % 2 == 0 ? 'A decorrer' : 'Terminado'}", // Replace with competition status
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: index % 2 == 0 ? Colors.green : Colors.red,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                "Quantidade de equipes: ${5 + index}", // Replace with team count
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        );
      },
    );
  }
}
