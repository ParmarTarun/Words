import 'package:flutter/material.dart';

import '../Widgets/drawer.dart';
import '../Widgets/wordTitle.dart';
import '../Widgets/wordDetails.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          children: <Widget>[
            WordTitle(),
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
