import 'package:flutter/material.dart';

class Mobilelayout extends StatelessWidget {
  const Mobilelayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Layout'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: const Text(
          'This is the mobile layout',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
