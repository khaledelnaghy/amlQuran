import 'package:aml/core/theme/app_colors.dart';
import 'package:aml/core/utils/app_asset.dart';
import 'package:aml/core/utils/app_style.dart';
import 'package:aml/feature/hadith/data/model/response/hadith_model.dart';
import 'package:aml/feature/hadith/presentation/view/hadith_content_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HadithDetailsView extends StatelessWidget {
  const HadithDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var hadithModel = GoRouterState.of(context).extra as HadithModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(hadithModel.title, style: AppStyle.s20),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            color: AppColors.blackColor,
            child: Image.asset(
              AppAsset.suradetailsbg,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Gap(15),
                Text(hadithModel.title, style: AppStyle.s20),
                Gap(15),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: ListView.builder(
                    itemCount: hadithModel.content.length,
                    itemBuilder: (context, index) {
                      return HadithContentItem(
                        content: hadithModel.content[index],
                        
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
