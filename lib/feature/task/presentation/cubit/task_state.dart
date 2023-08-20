abstract class TaskState {}

class TaskInitial extends TaskState {}

class GetDateLoadingState extends TaskState {}

class GetDateSucessState extends TaskState {}

class GetDateErrorState extends TaskState {}

class GetStartTimeLoadingState extends TaskState {}

class GetStartTimeSucessState extends TaskState {}

class GetStartTimeErrorState extends TaskState {}
class GetSelectedDateSucessState extends TaskState {}
class GetSelectedDateLoadingState extends TaskState {}
class ChangeThemeState extends TaskState {}
class GetThemeState extends TaskState {}

class GetEndTimeLoadingState extends TaskState {}

class GetEndTimeSucessState extends TaskState {}

class GetEndTimeErrorState extends TaskState {}

class ChangeCheckMarkIndexState extends TaskState {}

class InsertTaskLoadingState extends TaskState {}

class InsertTaskSucessState extends TaskState {}

class InsertTaskErrorState extends TaskState {}
class GetTaskLoadingState extends TaskState {}

class GetTaskSucessState extends TaskState {}

class GetTaskErrorState extends TaskState {}
class UpdateTaskLoadingState extends TaskState {}

class UpdateTaskSucessState extends TaskState {}

class UpdateTaskErrorState extends TaskState {}
class DeleteTaskLoadingState extends TaskState {}

class DeleteTaskSucessState extends TaskState {}

class DeleteTaskErrorState extends TaskState {}
