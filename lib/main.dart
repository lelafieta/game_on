import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import 'src/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterLocalization.instance.init(
    mapLocales: [
      const MapLocale('en', AppLocale.EN),
      const MapLocale('pt', AppLocale.PT),
    ],
    initLanguageCode: 'pt',
  );
  runApp(const GameOnApp());
}

mixin AppLocale {
  static const String title = 'title';

  static const Map<String, dynamic> EN = {title: 'Localization'};
  static const Map<String, dynamic> PT = {title: 'Localização'};
}
