import 'package:flutter/material.dart';

class WordDetails extends StatelessWidget {

  final String defination;
  final String examples;

  WordDetails(this.defination, this.examples);

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
            defination,
            style: Theme.of(context).textTheme.body1,
          ),
          SizedBox(
            height: 20,
          ),
          // Text(
          //   "examples:",
          //   style: Theme.of(context).textTheme.subtitle,
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          // Text(
          //   examples,
          //   style: Theme.of(context).textTheme.body2,
          // ),
        ],
      ),
    );
  }
}
