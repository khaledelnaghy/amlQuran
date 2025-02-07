import 'package:flutter/material.dart';

class SebhaView extends StatelessWidget {
  const SebhaView({super.key, this.index});
  final int? index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Sebha"),
      ),
    );
  }
}
