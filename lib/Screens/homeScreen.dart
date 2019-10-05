import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/favsProvider.dart';
import '../Providers/wordsProvider.dart';
import '../Widgets/drawer.dart';
import '../Widgets/wordWidget.dart';
import '../models/word.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Word> _fetchedWords;
  Word _currentWord;
  int _currentIndex = 0;
  bool _isMarkedFav = false;
  bool _isLoading = false;

  @override
  void initState() {
    _fetchedWords = Provider.of<WordsProvider>(context, listen: false).words;
    _currentWord = _fetchedWords[_currentIndex];
    super.initState();
  }

  void _changeWord(DismissDirection dismissData) {
    try {
      print(_fetchedWords.length.toString() + " " + _currentIndex.toString());
      if (_fetchedWords.length <= _currentIndex + 3) {
        setState(() {
          _isLoading = true;
        });
        //call for another batch
        Provider.of<WordsProvider>(context, listen: false)
            .fetchWords()
            .then(
              (_) => _fetchedWords = Provider.of<WordsProvider>(context).words,
            )
            .then((_) {
          setState(() {
            _isLoading = false;
          });
        }).catchError((e) {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text(
                "Oops!Something Went wrong.",
                style: Theme.of(context).textTheme.body2,
              ),
              content: Text(
                e.runtimeType == SocketException
                    ? "check your internet connection."
                    : e.runtimeType,
                style: Theme.of(context).textTheme.body2,
              ),
            ),
          );
        });
      }
      if (dismissData == DismissDirection.endToStart) {
        //swipe right
        setState(() {
          _currentIndex++;
          _currentWord = _fetchedWords[_currentIndex];
        });
      }
      if (dismissData == DismissDirection.startToEnd) {
        //swipe left

        if (_currentIndex == 0) {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text(
                "Oops...You've reached end of line",
                style: Theme.of(context).textTheme.body2,
              ),
              content: Text(
                "You should've swiped right!",
                style: Theme.of(context).textTheme.body2,
              ),
            ),
          );
          return;
        }
        _currentIndex--;
        setState(
          () {
            _currentWord = _fetchedWords[_currentIndex];
          },
        );
      }
      setState(() {
        _isMarkedFav = false;
      });
    } catch (e) {
      print(e.runtimeType);
    }
  }

  @override
  Widget build(BuildContext context) {
    final favsListData = Provider.of<FavsProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Words",
          style: Theme.of(context).textTheme.headline,
        ),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: _isLoading
            ? 
                 Center(
                   heightFactor: 10.0,
                  child: CircularProgressIndicator(),
                )
            : Dismissible(
                key: ValueKey(_currentWord.id),
                direction: DismissDirection.horizontal,
                onDismissed: (data) => _changeWord(data),
                child: Container(
                  height: MediaQuery.of(context).size.height - 70,
                  child: WordWidget(_currentWord),
                ),
              ),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.only(bottom: 50),
        child: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            child: _isMarkedFav
                ? Icon(
                    Icons.star,
                    color: Colors.white,
                  )
                : Icon(
                    Icons.star_border,
                    color: Colors.white,
                  ),
            onPressed: () {
              setState(() {
                _isMarkedFav = !_isMarkedFav;
              });
              _isMarkedFav
                  ? favsListData.addFav(_currentWord)
                  : favsListData.removeFav(_currentWord.id);
            }),
      ),
      bottomSheet: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: Text(
          "Swipe for next word",
          style: Theme.of(context).textTheme.headline,
        ),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
