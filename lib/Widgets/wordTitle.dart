import 'package:flutter/material.dart';

class WordTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24, left: 20, right: 20, bottom: 18),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Word",
            style: Theme.of(context).textTheme.subhead,
          ),
          IconButton(
            icon: Icon(
              Icons.play_arrow,
              size: 40.0,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
