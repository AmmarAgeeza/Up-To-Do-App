import 'package:get_it/get_it.dart';
import 'package:to_do_app/core/database/cache/cache_helper.dart';

import '../database/sqflite_helper/sqflite_helper.dart';

final sl = GetIt.instance;
Future<void> setup()async {
sl.registerLazySingleton<CacheHelper>(()=>CacheHelper());  
sl.registerLazySingleton<SqfliteHelper>(()=>SqfliteHelper());  

}