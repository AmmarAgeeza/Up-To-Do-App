import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/utils/app_strings.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //date now
              Text(DateFormat.yMMMMd().format(DateTime.now()),
                  style: Theme.of(context).textTheme.displayLarge),
              const SizedBox(
                height: 12,
              ),
              //Today
              Text(AppStrings.today,
                  style: Theme.of(context).textTheme.displayLarge),
              //date picker
              DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: AppColors.primary,
                selectedTextColor: AppColors.white,
                dateTextStyle: Theme.of(context).textTheme.displayMedium!,
                dayTextStyle: Theme.of(context).textTheme.displayMedium!,
                monthTextStyle: Theme.of(context).textTheme.displayMedium!,
                onDateChange: (date) {
                  // New date selected
                  // setState(() {
                  //   _selectedValue = date;
                  // });
                },
              ),
              const SizedBox(
                height: 50,
              ),
              //no tasks
              // noTasksWidget(context),
            ],
          ),
        ),
        //fab
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColors.primary,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Column noTasksWidget(BuildContext context) {
    return Column(
              children: [
                Image.asset(AppAssets.noTasks),
                Text(
                  AppStrings.noTaskTitle,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontSize: 24,
                      ),
                ),
                Text(
                  AppStrings.noTaskSubTitle,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ],
            );
  }
}
