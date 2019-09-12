import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchBar extends StatelessWidget {

  SearchBar({this.textChangeHandler});

  final Function textChangeHandler;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(hintText: "Repository search"),
        onChanged: textChangeHandler,
      ),
    );
  }


}
