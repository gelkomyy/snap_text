import 'package:flutter/material.dart';
import 'package:snap_text/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:snap_text/constans.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(child: HomeViewBody()),
    );
  }
}
