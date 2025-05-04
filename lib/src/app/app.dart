import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';

import '../config/routes/app_pages.dart';
import '../config/themes/app_theme.dart';

class GameOnApp extends StatelessWidget {
  const GameOnApp({super.key});

  @override
  Widget build(BuildContext context) {
    final FlutterLocalization localization = FlutterLocalization.instance;
    return GetMaterialApp(
      title: 'GameOn',
      darkTheme: AppTheme.lightTheme,
      theme: AppTheme.lightTheme,
      onGenerateRoute: AppPages.generateRoute,
      locale: const Locale('pt', 'PT'),
      supportedLocales: localization.supportedLocales,
      localizationsDelegates: localization.localizationsDelegates,
    );
  }
}
