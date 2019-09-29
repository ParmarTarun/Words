import 'package:flutter/material.dart';

import '../Widgets/wordTitle.dart';
import '../Widgets/wordDetails.dart';

class WordWidget extends StatelessWidget {
  final List word;

  WordWidget(this.word);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        word[1].isEmpty ? SizedBox() : WordTitle(word[1]),
        Divider(
          color: Theme.of(context).primaryColor,
          thickness: 3,
          endIndent: 20.0,
          indent: 20.0,
        ),
        WordDetails(word[2],word[3]),
      ],
    );
  }
}
