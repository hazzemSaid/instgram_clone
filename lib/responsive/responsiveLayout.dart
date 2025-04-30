import 'package:flutter/material.dart';
import 'package:instagram_clone/responsive/breakpoint.dart';

class Responsivelayout extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final mobileScreenLayout;
  // ignore: prefer_typing_uninitialized_variables
  final webScreenLayout;
  const Responsivelayout({
    super.key,
    required this.mobileScreenLayout,
    required this.webScreenLayout,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webBreakpoint) {
          // Web layout
          return webScreenLayout;
        } else {
          // Mobile layout
          return mobileScreenLayout;
        }
      },
    );
  }
}
