import 'package:aml/feature/home/data/model/response/sura_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SuraServices {
  SuraModel? suraModel;

  SuraModel getSuraModel(int index) => SuraModel.getSuraModel(index);

  static List<SuraModel> searchResult =
      List.generate(114, (index) => getSuraFromIndex(index));

  static SuraModel getSuraFromIndex(int index) => SuraModel(
        index: index,
        suraNameAr: SuraModel.suraArList[index],
        suraNameEn: SuraModel.suraEnList[index],
        numOfVerses: SuraModel.numOfVersesList[index],
      );

  static List<SuraModel> mostRecently = [];
  static void searchSuraName(String query) {
    if (query.isEmpty) {
      searchResult = List.generate(114, (index) => getSuraFromIndex(index));
    } else {
      searchResult = []; // إعادة تعيين القائمة
      for (int i = 0; i < SuraModel.suraEnList.length; i++) {
        if (SuraModel.suraEnList[i]
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            SuraModel.suraArList[i].contains(query)) {
          searchResult.add(getSuraFromIndex(i));
        }
      }
    }
  }

  static Future<void> getMostRecently() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String>? mostRecentlyIndexes =
        sharedPreferences.getStringList("mostRecentlyIndexes");
    if (mostRecentlyIndexes == null || mostRecentlyIndexes.isEmpty) {
      print("No recently used data found.");
      return;
    }
    print("Loaded mostRecentlyIndexes: $mostRecentlyIndexes");
    mostRecently = mostRecentlyIndexes.map(
      (indexString) {
        int index = int.parse(indexString);
        SuraModel suraModel = getSuraFromIndex(index);
        return suraModel;
      },
    ).toList();
  }

  static Future<void> addSuraToMostRecently(SuraModel suraModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool isFound = mostRecently
        .any((mostRecently) => mostRecently.index == suraModel.index);
    // if (isFound){
    //   mostRecently.removeWhere((mostRecently) => mostRecently.index == suraModel.index);
    // }
    if (!isFound) {
      mostRecently.add(suraModel);
      List<String> mostRecentlyIndexes =
          mostRecently.map((suraModel) => suraModel.index.toString()).toList();
      await sharedPreferences.setStringList("mostRecentlyIndexes", mostRecentlyIndexes);
    }
  }
}
