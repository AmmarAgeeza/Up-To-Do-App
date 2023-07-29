import 'package:flutter/material.dart';

import 'app/app.dart';
import 'core/database/cache/cache_helper.dart';
import 'core/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  await sl<CacheHelper>().init();

  runApp(const MyApp());
}
