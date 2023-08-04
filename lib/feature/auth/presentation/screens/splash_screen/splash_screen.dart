import 'package:flutter/material.dart';
import 'package:to_do_app/core/services/service_locator.dart';
import 'package:to_do_app/feature/task/presentation/screens/home_screen/home_screen.dart';

import '../../../../../core/database/cache/cache_helper.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_strings.dart';
import '../on_boarding_screens/on_boarding_screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  void navigate() async{
    bool isVisted = await sl<CacheHelper>().getData(
          key: AppStrings.onBoardingKey,
        ) ??
        false;
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => isVisted ? const HomeScreen() : OnBoaringScreens(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppAssets.logo),
          const SizedBox(height: 24),
          Text(
            AppStrings.appName,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: 40),
          )
        ],
      )),
    );
  }
}
