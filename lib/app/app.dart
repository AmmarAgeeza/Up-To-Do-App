import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/feature/task/presentation/cubit/task_state.dart';

import '../core/theme/theme.dart';
import '../feature/auth/presentation/screens/splash_screen/splash_screen.dart';
import '../feature/task/presentation/cubit/task_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return BlocBuilder<TaskCubit, TaskState>(
          builder: (context, state) {
            return MaterialApp(
                // title: 'To-Do App', =>//hard coded
                title: AppStrings.appName,
                theme: getAppTheme(),
                darkTheme: getAppDarkTheme(),
                themeMode: BlocProvider.of<TaskCubit>(context).isDark
                    ? ThemeMode.dark
                    : ThemeMode.light,
                debugShowCheckedModeBanner: false,
                home: const SplashScreen());
          },
        );
      },
    );
  }
}
