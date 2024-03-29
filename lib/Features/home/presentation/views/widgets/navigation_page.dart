import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_text/Features/bookmark/presentation/views/bookmark_view.dart';
import 'package:snap_text/Features/history/presentation/views/history_view.dart';
import 'package:snap_text/Features/home/presentation/manager/navigation_cubit/navigation_cubit.dart';
import 'package:snap_text/Features/home/presentation/views/home_view.dart';
import 'package:snap_text/Features/home/presentation/views/widgets/custom_bottoms_nav_bar.dart';
import 'package:snap_text/constans.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: CustomBottomNavBar(
            selectedIndex: state,
          ),
          backgroundColor: kBackgroundColor,
          body: getPage(state) /* SafeArea(child: HomeViewBody()) */,
        );
      },
    );
  }

  getPage(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const HistoryView();
      case 2:
        return const BookmarkView();
    }
  }
}
