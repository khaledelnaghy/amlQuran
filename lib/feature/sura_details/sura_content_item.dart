import 'package:aml/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SuraContentItem extends StatelessWidget {
  const SuraContentItem({super.key, this.content, this.index});
  final String? content;
  final int? index;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        
        children: [
          Text(
            "[${index != null ? index! + 1 : 1}]",
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 18,
            ),
          ),
          SizedBox(width: 2), // فراغ بين الرقم والنص
          Expanded(
            child: Text(
              content ?? '',
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              style: TextStyle(color: AppColors.primaryColor, fontSize: 18),
            ),
          ),
        ],
      ),
    );
    // return Container(
    //   padding: EdgeInsets.symmetric(vertical: 10),
    //   margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(20),
    //     border: Border.all(color: AppColors.primaryColor, width: 2),
    //   ),
    //   child: Text(
    //     textDirection: TextDirection.rtl,
    //     textAlign: TextAlign.center,
    //     "$content[${index ?? 1}]",
    //     style: TextStyle(color: AppColors.primaryColor),
    //   ),
    // );
  }
}
