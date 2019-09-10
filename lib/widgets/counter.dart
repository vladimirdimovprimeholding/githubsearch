import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  int counter;

  Counter({this.counter});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$counter',
      style: Theme.of(context).textTheme.display1,
    );
  }
}
