import 'package:flutter/material.dart';
import 'package:snap_text/Features/home/presentation/result_view.dart';
import 'package:snap_text/Features/home/presentation/views/home_view.dart';

void main() {
  runApp(const SnapText());
}

class SnapText extends StatelessWidget {
  const SnapText({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
