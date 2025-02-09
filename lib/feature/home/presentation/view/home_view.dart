import 'package:aml/core/routes/routes_name.dart';
import 'package:aml/core/services/sura_services.dart';
import 'package:aml/core/theme/app_colors.dart';
import 'package:aml/core/utils/app_asset.dart';
import 'package:aml/core/utils/app_string.dart';
import 'package:aml/core/utils/app_style.dart';
import 'package:aml/feature/home/presentation/widget/most_recently_section.dart';
import 'package:aml/feature/home/presentation/widget/sura_list.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              AppAsset.headOnBoarding,
            ),
            TextField(
              style: TextStyle(color: Theme.of(context).canvasColor),
              onChanged: (query) {
                setState(() {
                  SuraServices.searchSuraName(query);
                });
              },
              cursorColor: AppColors.whiteColor,
              decoration: InputDecoration(
                prefixIcon: ImageIcon(
                  color: AppColors.primaryColor,
                  AssetImage(AppAsset.iconSearch),
                ),
                hintText: AppString.suraName,
              ),
            ),
            Gap(20),
            Text(
              textAlign: TextAlign.start,
              AppString.mostRecently,
              style: AppStyle.s16.copyWith(color: AppColors.whiteColor),
            ),
            Gap(10),
            MostRecentlySection(),
            Gap(10),
            Text(
              AppString.nameSura,
              style: AppStyle.s16.copyWith(color: AppColors.whiteColor),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: SuraServices.searchResult.isEmpty
                  ? Center(
                      child: Text(
                        "Not Sura Found",
                        style:
                            AppStyle.s16.copyWith(color: AppColors.whiteColor),
                      ),
                    )
                  : ListView.separated(
                      physics: BouncingScrollPhysics(),
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: AppColors.whiteColor,
                          thickness: 1.5,
                          indent: 25.5,
                          endIndent: 25.5,
                        );
                      },
                      // padding: EdgeInsets.zero,
                      itemCount: SuraServices.searchResult.length,
                      itemBuilder: (context, index) {
                        final suraModel = SuraServices.searchResult[index];
                        return InkWell(
                          onTap: () async {
                            SuraServices.addSuraToMostRecently(suraModel);
                            await GoRouter.of(context).push(
                              RoutesName.suradetails,
                              extra: suraModel,
                            );
                            setState(() {});
                          },
                          child:
                              SuraList(suraModel: suraModel // استخدم عنصر البحث
                                  // suraModel: SuraModel.getSuraModel(index),
                                  ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
   // final data = SuraModel.searchResult[index];
                            // final data = SuraModel.getSuraModel(index);