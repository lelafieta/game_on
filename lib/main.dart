import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:game_on/src/app/app_entity.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'src/app/app.dart';
import 'src/app/di.dart' as di;
import 'src/core/cache/i_secure_storage_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('pt_BR', null);
  await dotenv.load(fileName: ".env");
  await di.init();
  AppEntity.uId = await di.sl<ISecureStorageHelper>().getData("uId");

  runApp(const GameOnApp());
}
