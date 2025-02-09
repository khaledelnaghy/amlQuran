import 'package:aml/core/theme/app_colors.dart';
import 'package:aml/core/utils/app_asset.dart';
import 'package:aml/core/utils/app_style.dart';
import 'package:aml/feature/home/data/model/response/sura_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SuraList extends StatefulWidget {
  const SuraList({
    super.key,
    required this.suraModel,
  });
  final SuraModel suraModel;

  @override
  State<SuraList> createState() => _SuraListState();
}

class _SuraListState extends State<SuraList> {
  @override
  Widget build(BuildContext context) {
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
              "${widget.suraModel.index + 1}",
              style: AppStyle.s14.copyWith(color: AppColors.whiteColor),
            ),
          ],
        ),
        Gap(24),
        Expanded(
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.suraModel.suraNameEn,
                    style: AppStyle.s16.copyWith(color: AppColors.whiteColor),
                  ),
                  Gap(5),
                  Text(
                    "${widget.suraModel.numOfVerses} Verses",
                    style: AppStyle.s14.copyWith(color: AppColors.whiteColor),
                  ),
                ],
              ),
            ],
          ),
        ),
        Text(
          widget.suraModel.suraNameAr,
          style: AppStyle.s16.copyWith(color: AppColors.whiteColor),
        ),
      ],
    );
  }
}
