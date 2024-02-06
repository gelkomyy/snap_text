import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_text/Features/home/presentation/manager/get_bookmark_items_cubit/get_bookmark_items_cubit.dart';
import 'package:snap_text/Features/home/presentation/views/widgets/history_item.dart';
import 'package:snap_text/Features/home/presentation/views/widgets/list_items_loading.dart';

class BookmarkSliverList extends StatelessWidget {
  const BookmarkSliverList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetBookmarkItemsCubit, GetBookmarkItemsState>(
      builder: (context, state) {
        if (state is GetAllBookmarkDone) {
          return SliverList.builder(
            itemCount: state.models.length,
            itemBuilder: (context, index) {
              return HistoryItem(imageModel: state.models[index]);
            },
          );
        } else if (state is GetAllBookmarkLoading) {
          return const SliverToBoxAdapter(child: ListItemsLoading());
        } else {
          return const SliverToBoxAdapter(
            child: Center(
                child: Text(
              'Bookmarks empty ...',
              style: TextStyle(fontSize: 22),
            )),
          );
        }
      },
    );
  }
}
