import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
