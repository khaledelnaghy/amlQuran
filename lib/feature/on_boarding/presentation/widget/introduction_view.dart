import 'package:aml/core/routes/routes_name.dart';
import 'package:aml/core/theme/app_colors.dart';
import 'package:aml/core/utils/app_asset.dart';
import 'package:aml/core/utils/app_string.dart';
import 'package:aml/core/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroductionView extends StatefulWidget {
  const IntroductionView(
      {super.key,
      this.fit,
      this.heigth,
      this.path,
      this.text,
      this.textDesc,
      this.width});
  final String? text;
  final String? textDesc;
  final BoxFit? fit;
  final double? width;
  final double? heigth;
  final String? path;

  @override
  State<IntroductionView> createState() => _IntroductionViewState();
}

class _IntroductionViewState extends State<IntroductionView> {
  int currentPage = 0; // bool isFirstPage = true

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return IntroductionScreen(
      curve: Curves.fastOutSlowIn,
      animationDuration: 250,
      globalBackgroundColor: AppColors.blackColor,
      next: Text(
        AppString.next,
        style: AppStyle.s16,
      ),
      back: Text(
        AppString.back,
        style: AppStyle.s16,
      ),
      done: Text(
        AppString.done,
        style: AppStyle.s16,
      ),
      skip: Text(
        AppString.skip,
        style: AppStyle.s16,
      ),
      onDone: () async {
        await saveOnboarding();
        // ignore: use_build_context_synchronously
        context.pushReplacement(RoutesName.navigationView);
      },
      showBackButton: currentPage > 0, // !isFirstPage
      dotsFlex: 3,
      showSkipButton: currentPage == 0, // isFirstPage
      resizeToAvoidBottomInset: false,
      onChange: (index) {
        setState(() {
          currentPage = index; //isFirstPage = (index == 0);
        });
      },
      dotsDecorator: DotsDecorator(
        color: AppColors.dotsBoarding,
        activeColor: AppColors.primaryColor,
        activeSize: Size(30, 8),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      pages: [
        PageViewModel(
          titleWidget: Image.asset(AppAsset.headOnBoarding),
          bodyWidget: Column(
            children: [
              Image.asset(
                AppAsset.welecome,
                height: size.height * .44,
              ),
              Text(
                AppString.welecome,
                style: AppStyle.s24,
              )
            ],
          ),
        ),
        PageViewModel(
          titleWidget: Image.asset(AppAsset.headOnBoarding),
          bodyWidget: Column(
            children: [
              Image.asset(
                AppAsset.masged,
                fit: BoxFit.fill,
                width: double.infinity,
                height: size.height * .33,
              ),
              Text(
                AppString.welecome,
                style: AppStyle.s24,
              ),
              Gap(20),
              Text(
                textAlign: TextAlign.center,
                AppString.onBoarding,
                style: AppStyle.s20,
              ),
            ],
            // textDesc: AppString.onBoarding,
            // path: AppAsset.masged,
            // heigth: size.height * .33,
            // width: double.infinity,
            // fit: BoxFit.fill,
            // text: AppString.welecome,
          ),
        ),
        PageViewModel(
          titleWidget: Image.asset(AppAsset.headOnBoarding),
          bodyWidget: Column(
            children: [
              Image.asset(
                AppAsset.mos7af,
                fit: BoxFit.fill,
                width: double.infinity,
                height: size.height * .33,
              ),
              Text(
                AppString.readingQuran,
                style: AppStyle.s24,
              ),
              Gap(20),
              Text(
                textAlign: TextAlign.center,
                AppString.radiodesc,
                style: AppStyle.s20,
              ),
            ],
          ),
        ),
        PageViewModel(
          titleWidget: Image.asset(AppAsset.headOnBoarding),
          bodyWidget: Column(
            children: [
              Image.asset(
                AppAsset.do3a,
                fit: BoxFit.fill,
                height: size.height * .34,
              ),
              Text(
                AppString.bearish,
                style: AppStyle.s24,
              ),
              Gap(20),
              Text(
                textAlign: TextAlign.center,
                AppString.bearishdesc,
                style: AppStyle.s20,
              ),
            ],
          ),
        ),
        PageViewModel(
          titleWidget: Image.asset(AppAsset.headOnBoarding),
          bodyWidget: Column(
            children: [
              Image.asset(
                AppAsset.radio,
                height: size.height * .34,
                width: double.infinity,
              ),
              Text(
                textAlign: TextAlign.center,
                AppString.holyQuranRadio,
                style: AppStyle.s24,
              ),
              Gap(20),
              Text(
                textAlign: TextAlign.center,
                AppString.holyQurandesc,
                style: AppStyle.s20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Future<void> saveOnboarding() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool(RoutesName.onBoarding, true);
}
