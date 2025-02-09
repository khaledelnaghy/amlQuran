import 'package:aml/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HadithContentItem extends StatelessWidget {
  const HadithContentItem({super.key, this.content});
  final String? content;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20 ),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        content??"",
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColors.primaryColor, fontSize: 18),
      ),
    );
  }
}
