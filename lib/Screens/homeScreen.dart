import 'package:flutter/material.dart';

import '../Widgets/word.dart';
import '../Widgets/wordDetails.dart';

class HomeScreen extends StatelessWidget {
  final String title = "Word";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Word(),
            Divider(
              color: Theme.of(context).primaryColor,
              thickness: 3,
              endIndent: 20.0,
              indent: 20.0,
            ),
            WordDetails(),
          ],
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
    );
  }
}
