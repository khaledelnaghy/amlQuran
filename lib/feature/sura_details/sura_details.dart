import 'package:aml/core/theme/app_colors.dart';
import 'package:aml/core/utils/app_asset.dart';
import 'package:aml/core/utils/app_style.dart';
import 'package:aml/feature/home/data/model/response/sura_model.dart';
import 'package:aml/feature/sura_details/sura_content_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SuraDetailsView extends StatefulWidget {
  const SuraDetailsView({
    super.key,
  });

  @override
  State<SuraDetailsView> createState() => _SuraDetailsViewState();
}

class _SuraDetailsViewState extends State<SuraDetailsView> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var suraModel = GoRouterState.of(context).extra as SuraModel;
    if (verses.isEmpty) {
      loadSuraFile(suraModel.index);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          suraModel.suraNameEn,
          style: AppStyle.s20,
        ),
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
                Text(suraModel.suraNameAr, style: AppStyle.s20),
                Gap(15),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: verses.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        )
                      : ListView.builder(
                          itemCount: verses.length,
                          itemBuilder: (context, index) {
                            return SuraContentItem(
                              content: verses[index],
                              index: index,
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

  Future<void> loadSuraFile(int index) async {
    String contentSura =
        await rootBundle.loadString("assets/file/sura/${index + 1}.txt");
    List<String> suraLines = contentSura.split("\r\n");
    //split عشان عدي كل اٌية في سطر
    for (int i = 0; i < suraLines.length; i++) {
      // print(suraLines[i]);
    }
    setState(() {
      verses = suraLines;
    });
  }
}
