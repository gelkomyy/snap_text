import 'package:flutter/material.dart';
import 'package:snap_text/Features/result/presentation/views/widgets/result_view_body.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffFAFBFD),
        title: const Text(
          'Result',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: const Color(0xffFAFBFD),
      body: const SafeArea(
        child: ResultViewBody(),
      ),
    );
  }
}
