import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/drawer.dart';
import '../Widgets/favList.dart';
import '../Providers/favsProvider.dart';

class FavouritesScreen extends StatefulWidget {
  static const routeName = '/favourites';

  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favourites",
          style: Theme.of(context).textTheme.headline,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.of(context).pushNamed('/');
            },
          ),
        ],
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: FavList(),
      bottomSheet: Consumer<FavsProvider>(
        builder: (context, favs,child)=> GestureDetector(
          onTap: () => favs.clearAll(),
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Text(
              "Clear All",
              style: Theme.of(context).textTheme.headline,
            ),
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
