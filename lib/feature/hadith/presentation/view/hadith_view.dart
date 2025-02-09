import 'package:aml/core/routes/routes_name.dart';
import 'package:aml/core/theme/app_colors.dart';
import 'package:aml/core/utils/app_asset.dart';
import 'package:aml/core/utils/app_style.dart';
import 'package:aml/feature/hadith/data/model/response/hadith_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HadithView extends StatefulWidget {
  const HadithView({super.key});

  @override
  State<HadithView> createState() => _HadithViewState();
}

class _HadithViewState extends State<HadithView> {
  List<HadithModel> hadithList = [];

  @override
  Widget build(BuildContext context) {
    if (hadithList.isEmpty) {
      loadHadithFile();
    }
    return Column(
      children: [
        Image.asset(
          AppAsset.mos7af,
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        CarouselSlider.builder(
          itemCount: hadithList.length,
          itemBuilder: (context, index, realIndex) {
            return InkWell(
              onTap: () {
                GoRouter.of(context).push(
                  RoutesName.hadithDetailsView,
                  extra: hadithList[index],
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.primaryColor,
                  image: DecorationImage(
                      image: AssetImage(AppAsset.hadithbg), fit: BoxFit.fill),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: hadithList.isEmpty
                      ?const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        )
                      : Column(
                          children: [
                            Gap(15),
                            Text(
                              hadithList[index].title,
                              style: AppStyle.s20
                                  .copyWith(color: AppColors.blackColor),
                            ),
                            Gap(10),
                            Expanded(
                              child: Text(
                                hadithList[index].content.join(""),
                                style: AppStyle.s16
                                    .copyWith(color: AppColors.blackColor),
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            );
          },
          options: CarouselOptions(
              height: 500, viewportFraction: 0.75, enlargeCenterPage: true
              // initialPage: 0,
              // enableInfiniteScroll: true,
              // reverse: false,
              // autoPlay: true,
              // autoPlayInterval: const Duration(seconds: 3),
              // autoPlayAnimationDuration: const Duration(milliseconds: 800),
              // autoPlayCurve: Curves.fastOutSlowIn,
              // enlargeCenterPage: true,
              // scrollDirection: Axis.horizontal,
              ),
        ),
      ],
    );
  }

  Future<void> loadHadithFile() async {
    // 1 - for loop => عشان عندي خمسين حديث
    for (int i = 1; i <= 50; i++) {
      String hadithContent =
          await rootBundle.loadString("assets/file/hadith/h$i.txt");
      List<String> hadithLines = hadithContent.split("\n");
      String title = hadithLines[0];
      hadithLines.removeAt(0); // removeAt => عشان معايا index
      HadithModel hadithModel = HadithModel(content: hadithLines, title: title);
      hadithList.add(hadithModel);
      setState(() {});
    }
  }
}
