import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/feature/task/presentation/cubit/task_cubit.dart';

import 'app/app.dart';
import 'core/bloc/bloc_observer.dart';
import 'core/database/cache/cache_helper.dart';
import 'core/database/sqflite_helper/sqflite_helper.dart';
import 'core/services/local_notification_service.dart';
import 'core/services/service_locator.dart';
import 'core/services/work_manager_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await setup();
  await sl<CacheHelper>().init();
  await Future.wait([
    LocalNotificationService.init(),
    WorkManagerService().init(),
  ]);
  sl<SqfliteHelper>().intiDB();

  runApp(
    BlocProvider(
      create: (context) => TaskCubit()
        ..getTheme()
        ..getTasks(),
      child: const MyApp(),
    ),
  );
}

//1.fix bugs [done]
//2.setup notification and workmanger [done]
//3.schedule notification. [Done]
//4.repeat notification daily. [done]