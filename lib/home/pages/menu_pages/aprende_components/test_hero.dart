import 'package:flutter/material.dart';

class HeroTest extends StatelessWidget {
  const HeroTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(tag: 'asd', child: Image.asset('assets/girl1.jpg')),
    );
  }
}