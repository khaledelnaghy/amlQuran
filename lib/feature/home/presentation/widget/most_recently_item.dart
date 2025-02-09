import 'package:aml/core/routes/routes_name.dart';
import 'package:aml/core/theme/app_colors.dart';
import 'package:aml/core/utils/app_asset.dart';
import 'package:aml/core/utils/app_style.dart';
import 'package:aml/feature/home/data/model/response/sura_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class MostRecentlyItem extends StatelessWidget {
  const MostRecentlyItem({super.key , required this.suraModel});
final SuraModel suraModel;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: (){
        GoRouter.of(context).push(
              RoutesName.suradetails,
              extra: suraModel,
            );
      },
      child: Container(
        height: double.infinity,
        width: screenSize.width * 0.7,
        padding: EdgeInsets.only(left: 12, right: 10),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        // margin: EdgeInsets.zero,
        // shadowColor: Colors.red,
        // elevation: 5,
      
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(5),
                Text(
                  suraModel.suraNameEn,
                  style:
                      AppStyle.s20.copyWith(color: AppColors.blackColor),
                ),
                Gap(5),
                Text(suraModel.suraNameAr,
                    style: AppStyle.s20
                        .copyWith(color: AppColors.blackColor)),
                Gap(8),
                Text("${suraModel.numOfVerses} Verses",
                    style: AppStyle.s14
                        .copyWith(color: AppColors.blackColor)),
              ],
            ),
            Image.asset(
              AppAsset.mostRecentaly,
              height: screenSize.width * 0.6,
              width: screenSize.width * 0.3,
              fit: BoxFit.fitHeight,
            ),
          ],
        ),
      ),
    );
    
  }
}