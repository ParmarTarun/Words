import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              title: Text(
                "Words",
                style: Theme.of(context).textTheme.headline,
              ),
              automaticallyImplyLeading: false,
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.of(context).pushNamed('/home');
              },
            ),
            Divider(
              color: Theme.of(context).primaryColor,
              endIndent: 30,
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Favourites"),
              onTap: () {
                Navigator.of(context).pushNamed('/favourites');
              },
            ),
            Divider(
              color: Theme.of(context).primaryColor,
              endIndent: 30,
            ),
          ],
        ),
      ),
    );
  }
}
