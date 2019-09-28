import 'package:flutter/material.dart';

import '../Widgets/drawer.dart';
import '../Widgets/wordWidget.dart';
import '../models/word.dart';
import '../DUMMY_DATA.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Word> fetchedWords = DUMMY_DATA;
  Widget currentWord;
  int currentIndex=0;

  @override
  void initState() {
    currentWord = WordWidget(
      fetchedWords[0].title,
      fetchedWords[0].defination,
      fetchedWords[0].examples,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (obj) {
        if (obj.velocity.pixelsPerSecond.dx < 0) {
          setState(() {
           currentIndex++; 
          });
          setState(
            () {
              currentWord = WordWidget(
                fetchedWords[currentIndex].title,
                fetchedWords[currentIndex].defination,
                fetchedWords[currentIndex].examples,
              );
            },
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Words",
            style: Theme.of(context).textTheme.headline,
          ),
          centerTitle: true,
        ),
        drawer: MyDrawer(),
        body: GestureDetector(
          child: SingleChildScrollView(
            child: currentWord,
          ),
        ),
        floatingActionButton: Container(
          padding: EdgeInsets.only(bottom: 50),
          child: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(
              Icons.star_border,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
        bottomSheet: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Text(
            "Swipe right for next word",
            style: Theme.of(context).textTheme.headline,
          ),
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
