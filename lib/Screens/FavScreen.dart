import 'package:flutter/material.dart';

import '../Widgets/drawer.dart';
import '../Widgets/favList.dart';


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
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: FavList(),
      bottomSheet: GestureDetector(
        onTap: () {},
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
    );
  }
}
