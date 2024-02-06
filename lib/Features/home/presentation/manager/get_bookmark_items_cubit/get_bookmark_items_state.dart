part of 'get_bookmark_items_cubit.dart';

@immutable
sealed class GetBookmarkItemsState {}

final class GetBookmarkItemsInitial extends GetBookmarkItemsState {}

final class GetAllBookmarkDone extends GetBookmarkItemsState {
  final List<ImageModel> models;

  GetAllBookmarkDone({required this.models});
}

final class GetAllBookmarkLoading extends GetBookmarkItemsState {}
