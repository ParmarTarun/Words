import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/wordWidget.dart';
import '../Providers/favsProvider.dart';

class FavList extends StatefulWidget {
  @override
  _FavListState createState() => _FavListState();
}

class _FavListState extends State<FavList> {
  String showId;

  void toggle(String id) {
    if (showId == id)
      setState(() {
        showId = null;
      });
    else {
      setState(() {
        showId = id;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final favsListData = Provider.of<FavouriteWords>(context);
    final favs = favsListData.favs;
    return ListView.builder(
      padding: EdgeInsets.only(top: 20, bottom: 50, left: 20, right: 20),
      itemBuilder: (BuildContext context, index) {
        return Card(
          child: Column(
            children: <Widget>[
              ListTile(
                onTap: () => toggle(favs[index].id),
                leading: IconButton(
                  icon: Icon(Icons.star, color: Theme.of(context).primaryColor),
                  onPressed: () => favsListData.removeFav(favs[index].id),
                ),
                title: Text(
                  favs[index].title,
                  style: Theme.of(context).textTheme.subhead,
                ),
                trailing: Icon(Icons.arrow_drop_down,
                    color: Theme.of(context).primaryColor),
              ),
              showId != favs[index].id
                  ? SizedBox()
                  : WordWidget(
                      [favs[index].id,"", favs[index].defination, favs[index].examples]),
            ],
          ),
        );
      },
      itemCount: favs.length,
    );
  }
}
