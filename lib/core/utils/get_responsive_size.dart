import 'package:flutter/material.dart';

double getResponsiveSize({
  required double theSize,
  required BuildContext context,
  required bool thisWidth,
}) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;
  // You can set a reference screen size, for example, an iPhone 8 size
  double referenceWidth = 392.72727272727275;
  double referenceHeight = 737.4545454545455;

  // Calculate the scaling factors
  double widthScale = screenWidth / referenceWidth;
  double heightScale = screenHeight / referenceHeight;

  // Choose the minimum scaling factor to maintain the aspect ratio
  double minScale = thisWidth ? widthScale : heightScale;

  // Apply the scaling factor to the original size
  return theSize * minScale;
}
