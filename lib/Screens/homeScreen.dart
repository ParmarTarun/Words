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
  bool _isLoading = true;
  bool _isNotStarted = true;

  @override
  void initState() {
    _fetchedWords = Provider.of<WordsProvider>(context, listen: false).words;
    _currentWord = _fetchedWords[_currentIndex];
    super.initState();
  }

  void _changeWord(DismissDirection dismissData) {
    try {
      print(_fetchedWords.length.toString() + " " + _currentIndex.toString());
      if (_fetchedWords.length == _currentIndex + 3) {
        //call for another batch
        Provider.of<WordsProvider>(context, listen: false)
            .fetchWords()
            .then((_) =>
                _fetchedWords = Provider.of<WordsProvider>(context).words)
            .catchError((e) => print(e));
      }
      if (dismissData == DismissDirection.endToStart) {
        //swipe right
        _isNotStarted = false;
        setState(() {
          _currentIndex++;
          _currentWord = _fetchedWords[_currentIndex];
        });
      }
      if (dismissData == DismissDirection.startToEnd) {
        //swipe left
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
      showDialog(
          context: context,
          child: AlertDialog(
            content: Text(
              "I just want you to know that you came too far south and even i don't know how to get back. BYE! :)",
              style: Theme.of(context).textTheme.body2,
            ),
          ));
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
        child: Dismissible(
          key: ValueKey(_currentWord.id),
          direction: DismissDirection.horizontal,
          onDismissed: (data) => _changeWord(data),
          child: Container(
            height: MediaQuery.of(context).size.height - 70,
            child: _isNotStarted
                ? Center(
                    child: Text("Swipe->"),
                  )
                : WordWidget(_currentWord),
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
