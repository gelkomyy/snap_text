import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:snap_text/Features/home/presentation/manager/database_manager_cubit/database_manager_cubit.dart';
import 'package:snap_text/Features/home/presentation/views/widgets/history_item.dart';

class HistorySliverList extends StatelessWidget {
  const HistorySliverList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatabaseManagerCubit, DatabaseManagerState>(
      builder: (context, state) {
        if (state is GetAllModelsDone) {
          return SliverList.builder(
            itemCount: state.models.length,
            itemBuilder: (context, index) {
              return HistoryItem(imageModel: state.models[index]);
            },
          );
        } else if (state is GetAllModelsLoading) {
          return SliverToBoxAdapter(
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              enabled: true,
              child: const SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    LoadingHistoryItem(),
                    LoadingHistoryItem(),
                    LoadingHistoryItem(),
                    LoadingHistoryItem(),
                    LoadingHistoryItem(),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(
                child: Text(
              'History empty ...',
              style: TextStyle(fontSize: 20),
            )),
          );
        }
      },
    );
  }
}

class LoadingHistoryItem extends StatelessWidget {
  const LoadingHistoryItem({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(top: 10),
      height: 60,
    );
  }
}
