part of 'database_manager_cubit.dart';

@immutable
sealed class DatabaseManagerState {}

final class DatabaseManagerInitial extends DatabaseManagerState {}

final class GetAllModelsLoading extends DatabaseManagerState {}

final class GetAllModelsDone extends DatabaseManagerState {}

final class InsertModelLoading extends DatabaseManagerState {}

final class InsertModelDone extends DatabaseManagerState {}

final class SaveModelLoading extends DatabaseManagerState {}

final class SaveModelDone extends DatabaseManagerState {}

final class ClearModelLoading extends DatabaseManagerState {}

final class ClearModelDone extends DatabaseManagerState {}

final class DeleteModelLoading extends DatabaseManagerState {}

final class DeleteModelDone extends DatabaseManagerState {}
