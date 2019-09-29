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
    return favsListData.favs.length == 0
        ? Center(
            child: Text("No favourites yet..."),
          )
        : ListView.builder(
            padding: EdgeInsets.only(top: 20, bottom: 50, left: 20, right: 20),
            itemBuilder: (BuildContext context, index) {
              return Card(
                child: Column(
                  children: <Widget>[
                    Dismissible(
                      key: ValueKey(favs[index].id),
                      background: Container(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(Icons.delete, color: Colors.white),
                        ),
                        color: Theme.of(context).primaryColor,
                      ),
                      confirmDismiss: (_) {
                        return showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  content: Text(
                                    "Confirm?",
                                    style: Theme.of(context).textTheme.body2,
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text("No",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor)),
                                      onPressed: () {
                                        Navigator.of(context).pop(false);
                                      },
                                    ),
                                    FlatButton(
                                      child: Text("Yes",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor)),
                                      onPressed: () {
                                        Navigator.of(context).pop(true);
                                      },
                                    )
                                  ],
                                ));
                      },
                      onDismissed: (_) =>
                          favsListData.removeFav(favs[index].id),
                      direction: DismissDirection.endToStart,
                      child: ListTile(
                        onTap: () => toggle(favs[index].id),
                        leading: IconButton(
                          icon: Icon(Icons.star,
                              color: Theme.of(context).primaryColor),
                          onPressed: () =>
                              favsListData.removeFav(favs[index].id),
                        ),
                        title: Text(
                          favs[index].title,
                          style: Theme.of(context).textTheme.body2,
                        ),
                        trailing: Icon(Icons.arrow_drop_down,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                    showId != favs[index].id
                        ? SizedBox()
                        : WordWidget([
                            favs[index].id,
                            "",
                            favs[index].defination,
                            favs[index].examples
                          ]),
                  ],
                ),
              );
            },
            itemCount: favs.length,
          );
  }
}
