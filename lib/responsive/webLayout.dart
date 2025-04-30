import 'package:flutter/material.dart';

class Weblayout extends StatelessWidget {
  const Weblayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Web Layout'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: const Text(
          'This is the web layout',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
