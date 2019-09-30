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
  List currentWord;
  int currentIndex = 0;
  bool _isMarkedFav = false;
  bool _isInit = true;
  bool _isLoading = true;
  List<Word> _fetchedWords;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<WordsProvider>(context)
          .fetchWord()
          .then(
              (_) => _fetchedWords = Provider.of<WordsProvider>(context).words)
          .then((_) {
        setState(() {
          _isLoading = false;
        });
        currentWord = [
          _fetchedWords[currentIndex].id,
          _fetchedWords[currentIndex].title,
          _fetchedWords[currentIndex].defination,
          _fetchedWords[currentIndex].examples,
        ];
      });
      _isInit = false;
      super.didChangeDependencies();
    }
  }

  void changeWord(DismissDirection dismissData) {
    if (dismissData.toString() == "DismissDirection.endToStart") {
      setState(() {
       _isLoading=true; 
      });
      Provider.of<WordsProvider>(context)
          .fetchWord()
          .then(
              (_) => _fetchedWords = Provider.of<WordsProvider>(context).words)
          .then((_) {
        setState(() {
          currentIndex++;
          currentWord = [
            _fetchedWords[currentIndex].id,
            _fetchedWords[currentIndex].title,
            _fetchedWords[currentIndex].defination,
            _fetchedWords[currentIndex].examples,
          ];
          _isLoading = false;
        });
      });
    }

    if (dismissData.toString() == "DismissDirection.startToEnd") {
      setState(
        () {
          currentIndex--;
          currentWord = [
            _fetchedWords[currentIndex].id,
            _fetchedWords[currentIndex].title,
            _fetchedWords[currentIndex].defination,
            _fetchedWords[currentIndex].examples,
          ];
        },
      );
    }
    setState(() {
      _isMarkedFav = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final favsListData = Provider.of<FavouriteWords>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Words",
          style: Theme.of(context).textTheme.headline,
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Dismissible(
                key: ValueKey(currentWord[0]),
                direction: DismissDirection.horizontal,
                onDismissed: (data) => changeWord(data),
                child: Container(
                  height: MediaQuery.of(context).size.height - 70,
                  child: WordWidget(currentWord),
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
            favsListData.addFav(
              Word(
                id: currentWord[0],
                title: currentWord[1],
                defination: currentWord[2],
                examples: currentWord[3],
              ),
            );
          },
        ),
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
