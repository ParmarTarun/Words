import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                "Words",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontFamily: 'Harlow',
                  fontSize: 32,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.of(context).pushNamed('/home');
              },
            ),
            Divider(color: Theme.of(context).primaryColor,endIndent: 30,),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Favourites"),
              onTap: () {
                Navigator.of(context).pushNamed('/favourites');
              },
            ),
            Divider(color: Theme.of(context).primaryColor,endIndent: 30,),
          ],
        ),
      ),
    );
  }
}
