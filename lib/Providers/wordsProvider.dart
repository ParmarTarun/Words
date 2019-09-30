import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/word.dart';

class WordsProvider with ChangeNotifier {
  List<Word> _words = [];
  
  List<Word> get words {
    return [..._words];
  }

  Future<void> fetchWord() async {
    const endpoint = 'https://wordsapi69.firebaseapp.com/word';
    try {
      final response = await http.get(endpoint);
      final extractedWord = json.decode(response.body);
      _words.add(Word(
        id: extractedWord['id'],
        title: extractedWord['word'],
        defination: extractedWord['meaning'],
        examples: "",
      ));
      notifyListeners();
    } catch (err) {
      throw (err);
    }
  }
}
