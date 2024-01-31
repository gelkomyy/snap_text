import 'package:flutter/material.dart';
import 'package:snap_text/Features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      body: SafeArea(child: HomeViewBody()),
    );
  }
}
