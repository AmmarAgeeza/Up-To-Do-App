abstract class TaskState {}

class TaskInitial extends TaskState {}

class GetDateLoadingState extends TaskState {}

class GetDateSucessState extends TaskState {}

class GetDateErrorState extends TaskState {}

class GetStartTimeLoadingState extends TaskState {}

class GetStartTimeSucessState extends TaskState {}

class GetStartTimeErrorState extends TaskState {}

class GetEndTimeLoadingState extends TaskState {}

class GetEndTimeSucessState extends TaskState {}

class GetEndTimeErrorState extends TaskState {}
class ChangeCheckMarkIndexState extends TaskState {}
