import 'package:flutter/material.dart';

import '../Widgets/wordTitle.dart';
import '../Widgets/wordDetails.dart';

import '../models/word.dart';

class WordWidget extends StatelessWidget {
  final Word word;

  WordWidget(this.word);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        word.title.isEmpty ? SizedBox() : WordTitle(word.title),
        Divider(
          color: Theme.of(context).primaryColor,
          thickness: 3,
          endIndent: 20.0,
          indent: 20.0,
        ),
        WordDetails(word.defination,word.examples),
      ],
    );
  }
}
