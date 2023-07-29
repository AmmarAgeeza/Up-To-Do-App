import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
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
void navigate(){
  Future.delayed(const Duration(seconds: 3),(){
    Navigator.push(context, MaterialPageRoute(builder: (_)=>const OnBoaringScreens()));
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppAssets.logo),
          const SizedBox(height: 24),
          Text(
            AppStrings.appName,
            style: GoogleFonts.lato(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40),
          )
        ],
      )),
    );
  }
}
