import 'package:flutter/material.dart';

void showCutomSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    showCloseIcon: true,
    backgroundColor: const Color(0xffFAFBFD),
    closeIconColor: const Color.fromARGB(255, 154, 9, 9),
    margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    content: Text(
      text,
      //textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.black),
    ),
  ));
}
