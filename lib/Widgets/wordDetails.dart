import 'package:flutter/material.dart';

class WordDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "a single distinct meaningful element of speech or writing,used with others (or sometimes alone) to form a sentence and typically shown with a space on either side when written or printed",
            style: Theme.of(context).textTheme.body1,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "examples:",
            style: Theme.of(context).textTheme.subtitle,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "\"This\" is an English Word",
            style: Theme.of(context).textTheme.body2,
          ),
        ],
      ),
    );
  }
}
