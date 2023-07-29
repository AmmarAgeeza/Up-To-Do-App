import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';

class OnBoardingModel {
  final String imgPath;
  final String title;
  final String subTitle;

  OnBoardingModel({
    required this.imgPath,
    required this.title,
    required this.subTitle,
  });
  static List<OnBoardingModel> onBoardingScreens = [
    OnBoardingModel(
        imgPath: AppAssets.on1,
        title: AppStrings.onBoardingTitleOne,
        subTitle: AppStrings.onBoardingSubTitleOne),
    OnBoardingModel(
        imgPath: AppAssets.on2,
        title: AppStrings.onBoardingTitleTwo,
        subTitle: AppStrings.onBoardingSubTitleTwo),
    OnBoardingModel(
        imgPath: AppAssets.on3,
        title: AppStrings.onBoardingTitleThree,
        subTitle: AppStrings.onBoardingSubTitleThree),
  ];
}
