import 'package:flutter/material.dart';

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
    return MaterialApp(
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
                fontSize: 48,
                fontWeight: FontWeight.w500,
              ),
              body1: TextStyle(
                //def,eg
                fontFamily: 'Georgia',
                fontStyle: FontStyle.italic,
                color: Color(0xFF5a99e9),
              ),
              body2: TextStyle(
                  //actual content
                  fontFamily: 'Georgia',
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
            ),
      ),
      home: MyHomePage(title: 'Words'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.headline,
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text("Subhead", style: Theme.of(context).textTheme.subhead,),
          Text("Body1", style: Theme.of(context).textTheme.body1,),
          Text("Body2", style: Theme.of(context).textTheme.body2,),
        ]
      )
    );
  }
}
