import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/widgets/custom_button.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../components/add_task_component.dart';
import '../../cubit/task_cubit.dart';
import '../../cubit/task_state.dart';

class AddTaskScreen extends StatelessWidget {
  TextEditingController titleController = TextEditingController();

  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        centerTitle: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        title: Text(
          AppStrings.addTask,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: BlocBuilder<TaskCubit, TaskState>(
              builder: (context, state) {
                final cubit =BlocProvider.of<TaskCubit>(context);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //! Title
                    AddTaskComponent(
                      controller: titleController,
                      tilte: AppStrings.tilte,
                      hintText: AppStrings.tilteHint,
                    ),
                    SizedBox(height: 24.h),
                    //! Note
                    AddTaskComponent(
                      controller: noteController,
                      tilte: AppStrings.note,
                      hintText: AppStrings.notehint,
                    ),
                    SizedBox(height: 24.h),
                    //! Date
                    AddTaskComponent(
                      tilte: AppStrings.date,
                      hintText: DateFormat.yMd().format(
                          cubit.currentDate),
                      suffixIcon: IconButton(
                        onPressed: () async {
                          BlocProvider.of<TaskCubit>(context).getDate(context);
                        },
                        icon: const Icon(
                          Icons.calendar_month_rounded,
                          color: AppColors.white,
                        ),
                      ),
                      readOnly: true,
                    ),
                    SizedBox(height: 24.h),
                    //! Start - End Time
                    Row(
                      children: [
                        // Start
                        Expanded(
                          child: AddTaskComponent(
                            readOnly: true,
                            tilte: AppStrings.startTime,
                            hintText:
                                BlocProvider.of<TaskCubit>(context).startTime,
                            suffixIcon: IconButton(
                              onPressed: () async {
                                BlocProvider.of<TaskCubit>(context)
                                    .getStartTime(context);
                              },
                              icon: const Icon(
                                Icons.timer_outlined,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 26,
                        ),
                        //! end
                        Expanded(
                          child: AddTaskComponent(
                            readOnly: true,
                            tilte: AppStrings.endTime,
                            hintText:
                                BlocProvider.of<TaskCubit>(context).endTime,
                            suffixIcon: IconButton(
                              onPressed: () async {
                                BlocProvider.of<TaskCubit>(context)
                                    .getEndTime(context);
                              },
                              icon: const Icon(
                                Icons.timer_outlined,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),

                    //!Color
                    SizedBox(
                      height: 68.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // color
                          Text(
                            AppStrings.color,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),

                          Expanded(
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: 6,
                              separatorBuilder: (context, index) =>
                                  SizedBox(width: 8.w),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<TaskCubit>(context)
                                        .changeCheckMarkIndex(index);
                                  },
                                  child: CircleAvatar(
                                    backgroundColor:
                                        BlocProvider.of<TaskCubit>(context)
                                            .getColor(index),
                                    child: index ==
                                            BlocProvider.of<TaskCubit>(context)
                                                .currentIndex
                                        ? const Icon(Icons.check)
                                        : null,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    //! add Task Button

                    SizedBox(height: 90.h),

                    SizedBox(
                      height: 48.h,
                      width: double.infinity,
                      child: CustomButton(
                        text: AppStrings.createTask,
                        onPressed: () {},
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
