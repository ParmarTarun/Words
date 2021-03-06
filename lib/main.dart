import 'package:flutter/material.dart';
import 'package:words/Screens/FavScreen.dart';

import './Screens/homeScreen.dart';
import 'package:provider/provider.dart';

import './Providers/favsProvider.dart';
import './Providers/wordsProvider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //My custom color cuz primarySwatch only takes MaterialColour
    const Map<int, Color> color = {
      50: Color.fromRGBO(28, 40, 54, .1),
      100: Color.fromRGBO(28, 40, 54, .2),
      200: Color.fromRGBO(28, 40, 54, .3),
      300: Color.fromRGBO(28, 40, 54, .4),
      400: Color.fromRGBO(28, 40, 54, .5),
      500: Color.fromRGBO(28, 40, 54, .6),
      600: Color.fromRGBO(28, 40, 54, .7),
      700: Color.fromRGBO(28, 40, 54, .8),
      800: Color.fromRGBO(28, 40, 54, .9),
      900: Color.fromRGBO(28, 40, 54, 1),
    };
    const MaterialColor primaryColor = MaterialColor(0xFF1c2836, color);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (ctx) => FavsProvider()),
        ChangeNotifierProvider(builder: (ctx) => WordsProvider())
      ],
      child: MaterialApp(
        title: 'Words',
        theme: ThemeData(
          primarySwatch: primaryColor,
          accentColor: Color(0xFFcccccc),
          textTheme: ThemeData.dark().textTheme.copyWith(
              headline: TextStyle(
                //appBar title
                fontFamily: 'Harlow',
                color: Colors.white,
              ),
              subhead: TextStyle(
                //word
                fontFamily: 'Georgia',
                color: primaryColor,
                fontSize: 36,
                fontWeight: FontWeight.w500,
              ),
              subtitle: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 20,
                color: Color(0xFF5a99e9),
              ),
              body1: TextStyle(
                  //def,eg
                  fontFamily: 'Georgia',
                  fontSize: 24,
                  color: primaryColor),
              body2: TextStyle(
                //actual content
                fontFamily: 'Georgia',
                fontSize: 20,
                fontStyle: FontStyle.italic,
                color: primaryColor,
              ),
              title: TextStyle(
                  fontFamily: 'Georgia', fontSize: 24, color: Colors.white)),
        ),
        routes: {
          '/': (ctx) => HomeScreen(),
          HomeScreen.routeName: (ctx) => HomeScreen(),
          FavouritesScreen.routeName: (ctx) => FavouritesScreen(),
        },
      ),
    );
  }
}