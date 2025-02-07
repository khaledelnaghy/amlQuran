import 'package:aml/core/theme/app_colors.dart';
import 'package:aml/core/utils/app_asset.dart';
import 'package:aml/core/utils/app_string.dart';
import 'package:aml/feature/hadith/presentation/view/hadith_view.dart';
import 'package:aml/feature/home/presentation/view/home_view.dart';
import 'package:aml/feature/radio/presentation/view/radio_view.dart';
import 'package:aml/feature/sebah/presentation/view/sebha_view.dart';
import 'package:aml/feature/time/presentation/view/time_view.dart';
import 'package:flutter/material.dart';

class NavigatorView extends StatefulWidget {
  const NavigatorView({super.key});

  @override
  State<NavigatorView> createState() => _NavigatorViewState();
}

class _NavigatorViewState extends State<NavigatorView> {
  int selectItem = 0;

  // List<Widget> pages = [
  //   const HomeView( ),
  //   const HadithView(),
  //   const SebhaView(),
  //   const RadioView(),
  //   const TimeView(),
  // ];

  List<String> backGroundImage = [
    AppAsset.backgrounghome,
    AppAsset.backgroundhadith,
    AppAsset.backgroungSeb7a,
    AppAsset.backgroundradio,
    AppAsset.backgroundtime,
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          getBackGroundImage(),
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          body: IndexedStack(
            index: selectItem,
            children: [
              HomeView(
                  // index: selectItem,
                  ),
              HadithView(
                  // index: selectItem,
                  ),
              SebhaView(
                  // index: selectItem,
                  ),
              RadioView(
                  // index: selectItem,
                  ),
              TimeView(
                  // index: selectItem,
                  ),
            ],
          ),

          // body: pages[selectItem],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectItem,
            onTap: (index) {
              setState(() {
                selectItem = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: buildItemInButtomNavBar(
                      index: 0, imagePath: AppAsset.iconquran),
                  label: AppString.quranLabel),
              BottomNavigationBarItem(
                  icon: buildItemInButtomNavBar(
                      index: 1, imagePath: AppAsset.iconhadeth),
                  label: AppString.hadethLabel),
              BottomNavigationBarItem(
                  icon: buildItemInButtomNavBar(
                      color: AppColors.blackColor,
                      index: 2,
                      imagePath: AppAsset.iconNecklace),
                  label: AppString.sebhaLabel),
              BottomNavigationBarItem(
                  icon: buildItemInButtomNavBar(
                      index: 3, imagePath: AppAsset.iconradio),
                  label: AppString.radioLabel),
              BottomNavigationBarItem(
                  icon: buildItemInButtomNavBar(
                      index: 4, imagePath: AppAsset.icontime),
                  label: AppString.timeLabel),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildItemInButtomNavBar(
      {required String imagePath, required int index, Color? color}) {
    return selectItem == index
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(66),
              color: AppColors.blackBgColor,
            ),
            child: ImageIcon(
                color: color,
                AssetImage(
                  imagePath,
                )),
          )
        : ImageIcon(color: color, AssetImage(imagePath));
  }

  String getBackGroundImage() {
    switch (selectItem) {
      case 0:
        return AppAsset.backgrounghome;
      case 1:
        return AppAsset.backgroundhadith;
      case 2:
        return AppAsset.backgroungSeb7a;
      case 3:
        return AppAsset.backgroundradio;
      case 4:
        return AppAsset.backgroundtime;
      default:
        return AppAsset.backgrounghome;
    }
  }
}
//  AppAsset.backgrounghome,
  //  AppAsset.backgroundhadith,
    //AppAsset.backgroungSeb7a,
     //AppAsset.backgroundradio,
     // AppAsset.backgroundtime,