import 'package:aml/core/theme/app_colors.dart';
import 'package:aml/core/utils/app_asset.dart';
import 'package:aml/core/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SuraList extends StatelessWidget {
  const SuraList(
      {super.key,
      required this.index,
      required this.ayaNumber,
      required this.suraNameAr,
      required this.suraNameEn});
  final int index;
  final String suraNameAr;
  final String suraNameEn;
  final String ayaNumber;
  @override
  Widget build(BuildContext context) {
    double size =16;
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              AppAsset.vectorImage,
              height: 40,
              width: 40,
            ),
            Text(
              "$index",
              style: AppStyle.s14.copyWith(color: AppColors.whiteColor),
            ),
          ],
        ),
        Gap(24),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    suraNameEn,
                    style: AppStyle.s16.copyWith(color: AppColors.whiteColor),
                  ),
                  Gap(5),
                  Text(
                    "$ayaNumber Verses",
                    style: AppStyle.s14.copyWith(color: AppColors.whiteColor),
                  ),
                ],
              ),
            ],
          ),
        ),
        Text(
          suraNameAr,
          style: AppStyle.s16.copyWith(color: AppColors.whiteColor),
        ),
      ],
    );
  }
}
