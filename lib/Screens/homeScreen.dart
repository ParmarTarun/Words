import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/favsProvider.dart';
import '../Widgets/drawer.dart';
import '../Widgets/wordWidget.dart';
import '../models/word.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Word> fetchedWords = [
    Word(
      id: '1',
      title: 'Word',
      defination: 'Word is a group of alphabets',
      examples: 'Word is a word',
    ),
    Word(
      id: '2',
      title: 'Keyboard',
      defination: 'Keyboard is user input device',
      examples: 'I use keyboard to type.',
    ),
    Word(
      id: '3',
      title: 'Home',
      defination:
          'the place where one lives permanently, especially as a member of a family or household',
      examples: 'an old people\'s home',
    ),
    Word(
      id: '4',
      title: 'Mouse',
      defination:
          'a small rodent that typically has a pointed snout, relatively large ears and eyes, and a long tail',
      examples: 'Cats chase mouse',
    ),
    Word(
      id: '5',
      title: 'Sentence',
      defination:
          'a set of words that is complete in itself, typically containing a subject and predicate, conveying a statement, question, exclamation, or command, and consisting of a main clause and sometimes one or more subordinate clauses.',
      examples: 'This is a sentence',
    ),
    Word(
      id: '6',
      title: 'God',
      defination:
          '(in Christianity and other monotheistic religions) the creator and ruler of the universe and source of all moral authority; the supreme being.',
      examples: 'God Damn it!',
    ),
    Word(
      id: '7',
      title: 'Man',
      defination: 'an adult human male',
      examples: 'Most intelligent animal',
    ),
    Word(
      id: '8',
      title: 'Hello',
      defination: 'used as a greeting or to begin a telephone conversation',
      examples: 'Hello evryone',
    ),
    Word(
      id: '9',
      title: 'Corpus',
      defination:
          'a collection of written texts, especially the entire works of a particular author or a body of writing on a particular subject',
      examples: 'Corpus Frequency',
    ),
    Word(
      id: '10',
      title: 'Enter',
      defination: 'come or go into (a place)',
      examples: 'Enter your password',
    ),
    Word(
      id: '11',
      title: 'Example',
      defination:
          'a thing characteristic of its kind or illustrating a general rule',
      examples: 'this is an example of word example',
    ),
    Word(
      id: '12',
      title: 'Frequency',
      defination:
          'he rate at which something occurs over a particular period of time or in a given sample',
      examples: 'Frequecy is inversly proportional to Wavelength',
    ),
    Word(
      id: '13',
      title: 'API',
      defination:
          'a set of functions and procedures allowing the creation of applications that access the features or data of an operating system, application, or other service.',
      examples: 'This App Uses Oxford dictionary APIs',
    ),
    Word(
      id: '14',
      title: 'Dictionary',
      defination:
          'a book or electronic resource that lists the words of a language (typically in alphabetical order) and gives their meaning, or gives the equivalent words in a different language, often also providing information about pronunciation, origin, and usag',
      examples: 'Dictionaries are good source of learning new words',
    ),
    Word(
      id: '15',
      title: 'Out',
      defination:
          'moving or appearing to move away from a particular place, especially one that is enclosed or hidden',
      examples: 'Get out',
    ),
    Word(
      id: '16',
      title: 'Try',
      defination: 'make an attempt or effort to do something',
      examples: 'Try everything before you die',
    ),
  ];
  List currentWord;
  int currentIndex = 0;
  bool _isMarkedFav = false;

  @override
  void initState() {
    currentWord = [
      fetchedWords[currentIndex].id,
      fetchedWords[currentIndex].title,
      fetchedWords[currentIndex].defination,
      fetchedWords[currentIndex].examples,
    ];
    super.initState();
  }

  void changeWord(DismissDirection dismissData) {
    setState(() {
      _isMarkedFav = false;
    });
    if (dismissData.toString() == "DismissDirection.endToStart") {
      setState(() {
        currentIndex++;
        currentWord = [
          fetchedWords[currentIndex].id,
          fetchedWords[currentIndex].title,
          fetchedWords[currentIndex].defination,
          fetchedWords[currentIndex].examples,
        ];
      });
    }
    if (dismissData.toString() == "DismissDirection.startToEnd") {
      setState(
        () {
          currentIndex--;
          currentWord = [
            fetchedWords[currentIndex].id,
            fetchedWords[currentIndex].title,
            fetchedWords[currentIndex].defination,
            fetchedWords[currentIndex].examples,
          ];
        },
      );
    }
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
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Dismissible(
          key: ValueKey(currentWord[0]),
          direction: DismissDirection.horizontal,
          onDismissed: (data) => changeWord(data),
          child: Container(
            height: MediaQuery.of(context).size.height-70,
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
