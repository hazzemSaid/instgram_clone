import 'package:flutter/material.dart';
import 'package:instagram_clone/responsive/breakpoint.dart';

class Responsivelayout extends StatelessWidget {
  final WidgetBuilder mobileScreenLayoutBuilder;
  final WidgetBuilder webScreenLayoutBuilder;
  const Responsivelayout({
    super.key,
    required this.mobileScreenLayoutBuilder,
    required this.webScreenLayoutBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webBreakpoint) {
          return webScreenLayoutBuilder(context);
        } else {
          return mobileScreenLayoutBuilder(context);
        }
      },
    );
  }
}
