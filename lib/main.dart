import 'package:flutter/material.dart';
import 'package:instagram_clone/responsive/mobileLayout.dart';
import 'package:instagram_clone/responsive/responsiveLayout.dart'
    show Responsivelayout;
import 'package:instagram_clone/responsive/webLayout.dart';

import './utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),

      home: Responsivelayout(
        mobileScreenLayout: const Mobilelayout(),
        webScreenLayout: const Weblayout(),
      ),
    );
  }
}
