import 'package:flutter/material.dart';

import 'src/app/app.dart';
import 'src/app/di.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp(const GameOnApp());
}
