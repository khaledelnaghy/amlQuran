import 'package:aml/core/services/sura_services.dart';
 import 'package:aml/feature/home/presentation/widget/most_recently_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MostRecentlySection extends StatelessWidget {
  const MostRecentlySection({super.key });
   
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: SuraServices.mostRecently.isNotEmpty,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.17,
        child: ListView.separated(
          itemCount: SuraServices.mostRecently.length,
          separatorBuilder: (context, index) => Gap(12),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
              MostRecentlyItem(suraModel: SuraServices.mostRecently.reversed.toList()[index]),
        ),
      ),
    );
  }
}
//reverse => لما بضغط علي الصورة بتظهر عندي في الاول مش ف الاخر 