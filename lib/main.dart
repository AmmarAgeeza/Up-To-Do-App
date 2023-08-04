import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/feature/task/presentation/cubit/task_cubit.dart';

import 'app/app.dart';
import 'core/bloc/bloc_observer.dart';
import 'core/database/cache/cache_helper.dart';
import 'core/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await setup();
  await sl<CacheHelper>().init();

  runApp(
    BlocProvider(
      create: (context) => TaskCubit(),
      child: const MyApp(),
    ),
  );
}
