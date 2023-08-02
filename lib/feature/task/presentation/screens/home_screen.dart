import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/core/widgets/custom_button.dart';

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
              InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          padding: const EdgeInsets.all(24),
                          height: 240,
                          color: AppColors.deepGrey,
                          child: Column(
                            children: [
                              //taskCompleted
                              SizedBox(
                                height: 48,
                                width: double.infinity,
                                child: CustomButton(
                                  text: AppStrings.taskCompleted,
                                  onPressed: () {},
                                ),
                              ),
                              const SizedBox(
                                height: 24,
                              ),

                              //deleteTask
                              SizedBox(
                                height: 48,
                                width: double.infinity,
                                child: CustomButton(
                                  text: AppStrings.deleteTask,
                                  onPressed: () {},
                                ),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              //cancel
                              SizedBox(
                                height: 48,
                                width: double.infinity,
                                child: CustomButton(
                                  text: AppStrings.cancel,
                                  onPressed: () {},
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: const TaskComponent()),
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

class TaskComponent extends StatelessWidget {
  const TaskComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 132,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.red,
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          //column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //text
                Text(
                  'Task 1',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 8),

                //row
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.timer,
                      color: AppColors.white,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '09:33 PM - 09:48 PM',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                //text
                Text(
                  'Learn Dart',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ],
            ),
          ),

          //divider
          Container(
            height: 75,
            width: 1,
            color: Colors.white,
            margin: const EdgeInsets.only(right: 10),
          ),
          // const SizedBox(width: 10,),
          //text
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              AppStrings.toDo,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          )
        ],
      ),
    );
  }
}
