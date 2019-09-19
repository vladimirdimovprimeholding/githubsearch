import 'package:flutter/material.dart';

class EmptyList extends StatelessWidget {

  EmptyList();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 30,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            "",
            style: TextStyle(fontSize: 20),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }

}
