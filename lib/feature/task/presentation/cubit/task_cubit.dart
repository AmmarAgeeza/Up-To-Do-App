import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/database/cache/cache_helper.dart';
import 'package:to_do_app/core/database/sqflite_helper/sqflite_helper.dart';
import 'package:to_do_app/core/services/local_notification_service.dart';
import 'package:to_do_app/feature/task/presentation/cubit/task_state.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/app_colors.dart';
import '../../data/model/task_model.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());
  DateTime currentDate = DateTime.now();
  DateTime selctedDate = DateTime.now();
  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  String endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 45)));
  int currentIndex = 0;
  TextEditingController titleController = TextEditingController();

  TextEditingController noteController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //get Date From User
  void getDate(context) async {
    emit(GetDateLoadingState());
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
      // initialDatePickerMode: DatePickerMode.day,
      // initialEntryMode: DatePickerEntryMode.inputOnly,
    );

    if (pickedDate != null) {
      currentDate = pickedDate;
      emit(GetDateSucessState());
    } else {
      print('pickedDate == null');
      emit(GetDateErrorState());
    }
  }

  late TimeOfDay schduledTime;
  void getStartTime(context) async {
    emit(GetStartTimeLoadingState());

    TimeOfDay? pickedStartTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );
    if (pickedStartTime != null) {
      startTime = pickedStartTime.format(context);
      schduledTime = pickedStartTime;
      emit(GetStartTimeSucessState());
    } else {
      print('pickedStartTime ==null');
      schduledTime =
          TimeOfDay(hour: currentDate.hour, minute: currentDate.minute);
      emit(GetStartTimeErrorState());
    }
  }

  void getEndTime(context) async {
    emit(GetEndTimeLoadingState());

    TimeOfDay? pickedEndTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );
    if (pickedEndTime != null) {
      endTime = pickedEndTime.format(context);
      emit(GetEndTimeSucessState());
    } else {
      print('pickedStartTime ==null');
      emit(GetEndTimeErrorState());
    }
  }

  Color getColor(index) {
    switch (index) {
      case 0:
        return AppColors.red;
      case 1:
        return AppColors.green;
      case 2:
        return AppColors.blueGrey;
      case 3:
        return AppColors.blue;
      case 4:
        return AppColors.orange;
      case 5:
        return AppColors.purple;
      default:
        return AppColors.grey;
    }
  }

  void changeCheckMarkIndex(index) {
    currentIndex = index;
    emit(ChangeCheckMarkIndexState());
  }

  void getSelectedDate(date) {
    emit(GetSelectedDateLoadingState());
    selctedDate = date;

    emit(GetSelectedDateSucessState());
    getTasks();
  }

  List<TaskModel> tasksList = [];
  void insertTask() async {
    emit(InsertTaskLoadingState());

    try {
      await sl<SqfliteHelper>().insertToDB(
        TaskModel(
          date: DateFormat.yMd().format(currentDate),
          title: titleController.text,
          note: noteController.text,
          startTime: startTime,
          endTime: endTime,
          isCompleted: 0,
          color: currentIndex,
        ),
      );
      LocalNotificationService.showSchduledNotification(
        curretDate: currentDate,
        schduledTime:schduledTime,
        taskModel: TaskModel(
          date: DateFormat.yMd().format(currentDate),
          title: titleController.text,
          note: noteController.text,
          startTime: startTime,
          endTime: endTime,
          isCompleted: 0,
          color: currentIndex,
        ),
      );
      //! to make screen wait 1 second
      //  await  Future.delayed(const Duration(seconds: 3));
      //   tasksList.add(TaskModel(
      //     id: '1',
      //     date: DateFormat.yMd().format(currentDate),
      //     title: titleController.text,
      //     note: noteController.text,
      //     startTime: startTime,
      //     endTime: endTime,
      //     isCompleted: false,
      //     color: currentIndex,
      //   ));
      titleController.clear();
      noteController.clear();
      emit(InsertTaskSucessState());
      getTasks();
    } catch (e) {
      emit(InsertTaskErrorState());
    }
  }

//!get Tasks
  void getTasks() async {
    emit(GetDateLoadingState());
    await sl<SqfliteHelper>().getFromDB().then((value) {
      tasksList = value
          .map((e) => TaskModel.fromJson(e))
          .toList()
          .where(
            (element) => element.date == DateFormat.yMd().format(selctedDate),
          )
          .toList();
      emit(GetDateSucessState());
    }).catchError((e) {
      print(e.toString());
      emit(GetDateErrorState());
    });
  }

  //update Task
  void updateTask(id) async {
    emit(UpdateTaskLoadingState());

    await sl<SqfliteHelper>().updatedDB(id).then((value) {
      emit(UpdateTaskSucessState());
      getTasks();
    }).catchError((e) {
      print(e.toString());
      emit(UpdateTaskErrorState());
    });
  }

//delete task
  void deleteTask(id) async {
    emit(DeleteTaskLoadingState());

    await sl<SqfliteHelper>().deleteFromDB(id).then((value) {
      emit(DeleteTaskSucessState());
      getTasks();
    }).catchError((e) {
      print(e.toString());
      emit(DeleteTaskErrorState());
    });
  }

  bool isDark = false;
  void changeTheme() async {
    isDark = !isDark;
    await sl<CacheHelper>().saveData(key: 'isDark', value: isDark);
    emit(ChangeThemeState());
  }

  void getTheme() async {
    isDark = await sl<CacheHelper>().getData(key: 'isDark');
    emit(GetThemeState());
  }
}
