import 'package:flutter/material.dart';

class TimeView extends StatelessWidget {
  const TimeView({super.key, this.index});
  final int? index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Time View"),
      ),
    );
  }
}
