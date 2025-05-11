import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalStorage {
  static const String favoriteBoxString = "Favorite Box";
  static final favoriteBox = Hive.box(favoriteBoxString);
  static initLocalStorage() async {
    // To intialise the hive database
    await Hive.initFlutter();
    await Hive.openBox(favoriteBoxString);
  }

  static void addDataIntoFavoriteBox(int id) {
    favoriteBox.put(id, id);
  }

  static void removeDataFromFavoriteBox(int id) {
    favoriteBox.delete(id);
  }

 static List<int> getAllDataFromFavBox() {
    return favoriteBox.values.toList() as List<int>;
  }
}
