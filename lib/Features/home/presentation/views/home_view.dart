import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_text/Features/home/presentation/manager/get_history_items_cubit/get_history_items_cubit.dart';
import 'package:snap_text/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:snap_text/constans.dart';
import 'package:snap_text/core/utils/request_permissions.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetHistoryItemsCubit>(context).getAllModels();

    requestPermissionsStoragePhotos();
    requestPermissionsCamera();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // bottomNavigationBar: CustomBottomNavBar(),
      backgroundColor: kBackgroundColor,
      body: SafeArea(child: HomeViewBody()),
    );
  }
}
