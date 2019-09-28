import 'package:flutter/material.dart';

import '../Widgets/wordTitle.dart';
import '../Widgets/wordDetails.dart';

class WordWidget extends StatelessWidget {
  final String title;
  final String defination;
  final String examples;

  WordWidget(this.title, this.defination, this.examples);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        title.isEmpty ? SizedBox() : WordTitle(title),
        Divider(
          color: Theme.of(context).primaryColor,
          thickness: 3,
          endIndent: 20.0,
          indent: 20.0,
        ),
        WordDetails(defination, examples),
      ],
    );
  }
}
