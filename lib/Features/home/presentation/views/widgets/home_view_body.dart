import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:snap_text/Features/home/presentation/manager/navigation_cubit/navigation_cubit.dart';
import 'package:snap_text/Features/home/presentation/views/widgets/history_sliver_list.dart';
import 'package:snap_text/Features/home/presentation/views/widgets/selection_source.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Image.asset(
                    'assets/ocr.png',
                    width: 40,
                  ),
                  Shimmer.fromColors(
                    period: const Duration(seconds: 8),
                    baseColor: const Color(0xff151718),
                    highlightColor: Colors.grey.shade300,
                    child: const Text(
                      'Snap Text',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 25,
            ),
          ),
          const SliverToBoxAdapter(
            child: Text(
              'Hey, what will you do today? 🤔',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          const SliverToBoxAdapter(
            child: SelectionSource(),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'History',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {
                    BlocProvider.of<NavigationCubit>(context)
                        .navigationIndexView(1);
                    /* Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const HistoryView();
                    })); */
                  },
                  child: const Text(
                    'See all',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          const HistorySliverList()
        ],
      ),
    );
  }
}
