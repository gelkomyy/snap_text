import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_text/Features/home/presentation/manager/get_history_items_cubit/get_history_items_cubit.dart';
import 'package:snap_text/Features/home/presentation/views/widgets/history_item.dart';
import 'package:snap_text/Features/home/presentation/views/widgets/list_items_loading.dart';
import 'package:snap_text/core/utils/check_screen_view.dart';

class HistorySliverList extends StatelessWidget {
  const HistorySliverList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetHistoryItemsCubit, GetHistoryItemsState>(
      builder: (context, state) {
        if (state is GetAllHistoryDone) {
          return SliverList.builder(
            itemCount: isHomeView(context)
                ? (state.models.length <= 8 ? state.models.length : 8)
                : state.models.length,
            itemBuilder: (context, index) {
              return HistoryItem(imageModel: state.models[index]);
            },
          );
        } else if (state is GetAllHistoryLoading) {
          return const SliverToBoxAdapter(child: ListItemsLoading());
        } else {
          return const SliverToBoxAdapter(
            child: Center(
                child: Text(
              'History empty ...',
              style: TextStyle(fontSize: 22),
            )),
          );
        }
      },
    );
  }
}
