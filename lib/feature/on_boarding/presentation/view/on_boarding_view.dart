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

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
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
        context.pushReplacement(RoutesName.homeView);
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
          bodyWidget: buildImage(
            path: AppAsset.welecome,
            heigth: size.height * .44,
            text: AppString.welecome,
          ),
        ),
        PageViewModel(
          titleWidget: Image.asset(AppAsset.headOnBoarding),
          bodyWidget: buildImageDesc(
            textDesc: AppString.onBoarding,
            path: AppAsset.masged,
            heigth: size.height * .33,
            width: double.infinity,
            fit: BoxFit.fill,
            text: AppString.welecome,
          ),
        ),
        PageViewModel(
          titleWidget: Image.asset(AppAsset.headOnBoarding),
          bodyWidget: buildImageDesc(
            textDesc: AppString.radiodesc,
            path: AppAsset.mos7af,
            heigth: size.height * .33,
            width: double.infinity,
            fit: BoxFit.fill,
            text: AppString.readingQuran,
          ),
        ),
        PageViewModel(
          titleWidget: Image.asset(AppAsset.headOnBoarding),
          bodyWidget: buildImageDesc(
            textDesc: AppString.bearishdesc,
            path: AppAsset.do3a,
            heigth: size.height * .34,
            text: AppString.bearish,
            fit: BoxFit.fill,
          ),
        ),
        PageViewModel(
          titleWidget: Image.asset(AppAsset.headOnBoarding),
          bodyWidget: buildImageDesc(
            textDesc: AppString.holyQurandesc,
            path: AppAsset.radio,
            heigth: size.height * .34,
            width: double.infinity,
            text: AppString.holyQuranRadio,
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

Widget buildImage(
    {required String path,
    required double heigth,
    String? text,
    BoxFit? fit,
    double? width}) {
  return text != null
      ? Column(
          children: [
            Image.asset(
              path,
              height: heigth,
              fit: fit,
              width: width,
            ),
            Gap(10),
            Text(
              textAlign: TextAlign.center,
              text,
              style: AppStyle.s24,
            ),
          ],
        )
      : Image.asset(
          path,
          height: heigth,
        );
}

Widget buildImageDesc(
    {required String path,
    required String textDesc,
    required double heigth,
    String? text,
    BoxFit? fit,
    double? width}) {
  return text != null
      ? Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              path,
              height: heigth,
              fit: fit,
              width: width,
            ),
            Gap(10),
            Text(
              textAlign: TextAlign.center,
              text,
              style: AppStyle.s24,
            ),
            Gap(10),
            Text(
              textAlign: TextAlign.center,
              textDesc,
              style: AppStyle.s20,
            ),
          ],
        )
      : Image.asset(
          path,
          height: heigth,
        );
}



//  PageViewModel(
//           titleWidget: Image.asset(AppAsset.headOnBoarding),
//           bodyWidget: Column(
//             children: [
//               Image.asset(
//                 AppAsset.masged,
//                 fit: BoxFit.fill,
//                 width: double.infinity,
//                 height: size.height * .33,
//               ),
//               Text(
//                 AppString.welecome,
//                 style: AppStyle.s24,
//               ),
//               Gap(20),
//               Text(
//                 textAlign: TextAlign.center,
//                 AppString.onBoarding,
//                 style: AppStyle.s20,
//               ),
//             ],
//           ),
//         ),