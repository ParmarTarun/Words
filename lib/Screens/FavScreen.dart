import 'package:flutter/material.dart';

import '../Widgets/drawer.dart';
import '../models/word.dart';
import '../DUMMY_DATA.dart';
// import '../Widgets/wordWidget.dart';

class FavouritesScreen extends StatelessWidget {
  static const routeName = '/favourites';

  final List<Word> favs = DUMMY_DATA;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favourites",
          style: Theme.of(context).textTheme.headline,
        ),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: ListView.builder(
        padding: EdgeInsets.only(top: 20, bottom: 50, left: 20, right: 20),
        itemBuilder: (BuildContext context, index) {
          return Card(
            color: Theme.of(context).primaryColor,
            child: ListTile(
              onTap: (){},
              leading: IconButton(
                icon: Icon(Icons.star, color: Colors.white),
                onPressed: () {},
              ),
              title: Text(
                favs[index].title,
                style: TextStyle(
                    fontFamily: 'Georgia', fontSize: 24, color: Colors.white),
              ),
              trailing: Icon(Icons.arrow_drop_down, color: Colors.white),
            ),
          );
        },
        itemCount: favs.length,
      ),
      bottomSheet: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: Text(
          "Clear All",
          style: Theme.of(context).textTheme.headline,
        ),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
