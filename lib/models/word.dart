import 'package:flutter/material.dart';

class Word {
  @required
  final String id;
  @required
  final String title;
  @required
  final String defination;
  @required
  final String examples;

  const Word({
    this.id,
    this.title,
    this.defination,
    this.examples,
  });
}
