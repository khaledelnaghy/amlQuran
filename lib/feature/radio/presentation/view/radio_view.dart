import 'package:flutter/material.dart';

class RadioView extends StatelessWidget {
  const RadioView({super.key ,   this.index});
final int? index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Radio")),
    );
  }
}
