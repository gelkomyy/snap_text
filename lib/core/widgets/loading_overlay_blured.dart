import 'dart:ui';

import 'package:flutter/material.dart';

class LoadingOverlayBlured extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  const LoadingOverlayBlured({
    super.key,
    required this.child,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        isLoading
            ? Stack(
                children: [
                  AbsorbPointer(
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 1.3, sigmaY: 1.3),
                      child: Container(
                          color: Colors.transparent,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: child),
                    ),
                  ),
                  const Center(
                    child: CircularProgressIndicator(),
                  )
                ],
              )
            : const SizedBox(),
      ],
    );
  }
}
