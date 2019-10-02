import 'package:flutter/material.dart';

import '../models/word.dart';

class FavsProvider with ChangeNotifier {
  List<Word> _favs = [];

  List<Word> get favs {
    return [..._favs];
  }

  void addFav(Word newFav) {
    _favs.add(Word(
      id: newFav.id,
      title: newFav.title,
      defination: newFav.defination,
      examples: newFav.examples,
    ));
    notifyListeners();
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
