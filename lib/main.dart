import 'package:flutter/material.dart';

void main() {
  runApp(const SnapText());
}

class SnapText extends StatelessWidget {
  const SnapText({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(),
    );
  }
}
