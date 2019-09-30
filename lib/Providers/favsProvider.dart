import 'package:flutter/material.dart';


import '../models/word.dart';

class FavouriteWords with ChangeNotifier {
  List<Word> _favs =[];

  List<Word> get favs {
    return [..._favs];
  }
 
  

  void addFav(Word newFav) {
    if (!_favs.contains(newFav)) {
      _favs.add(newFav);
      notifyListeners();
    }
  }

  void removeFav(String removeId) {
    _favs.removeWhere((word) => word.id == removeId);
    notifyListeners();
  }

  void clearAll() {
    _favs.clear();
    notifyListeners();
  }
}
