import 'package:flutter/material.dart';

bool isHomeView(BuildContext context) {
  return ModalRoute.of(context)?.settings.name == '/home';
}
