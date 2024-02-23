import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:to_do_app/core/database/cache/cache_helper.dart';
import 'package:to_do_app/feature/auth/data/model/on_boarding_model.dart';

import '../../../../../core/commons/commons.dart';
import '../../../../../core/services/service_locator.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_button.dart';
import '../../../../task/presentation/screens/home_screen/home_screen.dart';

class OnBoaringScreens extends StatelessWidget {
  OnBoaringScreens({super.key});
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(24),
        child: PageView.builder(
          controller: controller,
          itemCount: OnBoardingModel.onBoardingScreens.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                //skip text
                index != 2
                    ? Align(
                        alignment: Alignment.centerLeft,
                        child: CustomTextButton(
                          text: AppStrings.skip,
                          onPressed: () {
                            controller.jumpToPage(2);
                          },
                        ),
                      )
                    : const SizedBox(
                        height: 50,
                      ),
                const SizedBox(
                  height: 16,
                ),
                //image
                Image.asset(OnBoardingModel.onBoardingScreens[index].imgPath),
                const SizedBox(
                  height: 16,
                ),

                //dots
                SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                      activeDotColor: AppColors.primary,
                      // dotColor: AppColors.red
                      dotHeight: 10,
                      spacing: 8
                      // dotWidth: 10
                      ),
                ),
                const SizedBox(
                  height: 52,
                ),

                //title
                Text(
                  OnBoardingModel.onBoardingScreens[index].title,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(
                  height: 42,
                ),

                //subTitle
                Text(
                  OnBoardingModel.onBoardingScreens[index].subTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const Spacer(),
                //buttons
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //back button
                    index != 0
                        ? CustomTextButton(
                            text: AppStrings.back,
                            onPressed: () {
                              controller.previousPage(
                                duration: const Duration(milliseconds: 1000),
                                curve: Curves.fastLinearToSlowEaseIn,
                              );
                            },
                          )
                        : Container(),
                    //spacer
                    const Spacer(),
                    //next Button
                    index != 2
                        ? CustomButton(
                            text: AppStrings.next,
                            onPressed: () {
                              controller.nextPage(
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.fastLinearToSlowEaseIn);
                            },
                          )
                        : CustomButton(
                            text: AppStrings.getStarted,
                            onPressed: () async {
                              //navigate to home screen
                              await sl<CacheHelper>()
                                  .saveData(
                                      key: AppStrings.onBoardingKey,
                                      value: true)
                                  .then((value) {
                                print('onBoarding is Visited');
                                navigate(
                                    context: context,
                                    screen: const HomeScreen());
                              }).catchError((e) {
                                print(e.toString());
                              });
                            })
                  ],
                )
              ],
            );
          },
        ),
      )),
    );
  }
}
