import 'package:get/get.dart';

class FavoritesController extends GetxController {
  List<String> _favorites = [];
  List<String> get favorites => _favorites;
  bool _isFavorite = false;
  bool get isFavorite => _isFavorite;

  Future<void> getFavorite(String item) async {
    if (_favorites.contains(item)) {
      return;
    } else {
      _favorites.add(item);
    }
    await Future.delayed(Duration(milliseconds: 500));
    update();
    print(favorites.length);
  }

  bool favoritesCheck(item) {
    _isFavorite = false;
    if (_favorites.contains(item)) {
      return _isFavorite = true;
    }
    return _isFavorite = false;
  }

  Future<void> deleteItem(index) async {
    _favorites.removeAt(index);
    update();
  }
}
