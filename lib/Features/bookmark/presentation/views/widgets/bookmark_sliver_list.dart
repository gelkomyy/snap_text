import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_text/Features/bookmark/presentation/views/widgets/bookmark_item.dart';
import 'package:snap_text/Features/home/presentation/manager/get_bookmark_items_cubit/get_bookmark_items_cubit.dart';
import 'package:snap_text/Features/home/presentation/views/widgets/list_items_loading.dart';
import 'package:snap_text/core/utils/get_responsive_font_size.dart';

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
              return BookmarkItem(imageModel: state.models[index]);
            },
          );
        } else if (state is GetAllBookmarkLoading) {
          return const SliverToBoxAdapter(child: ListItemsLoading());
        } else {
          return SliverToBoxAdapter(
            child: Center(
                child: Text(
              'Bookmarks empty ...',
              style: TextStyle(
                fontSize: getResponsiveFontSize(context, fontSize: 22),
              ),
            )),
          );
        }
      },
    );
  }
}
