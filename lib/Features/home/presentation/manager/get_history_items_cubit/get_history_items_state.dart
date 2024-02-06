part of 'get_history_items_cubit.dart';

@immutable
sealed class GetHistoryItemsState {}

final class GetHistoryItemsInitial extends GetHistoryItemsState {}

final class GetAllHistoryDone extends GetHistoryItemsState {
  final List<ImageModel> models;

  GetAllHistoryDone({required this.models});
}

final class GetAllHistoryLoading extends GetHistoryItemsState {}
