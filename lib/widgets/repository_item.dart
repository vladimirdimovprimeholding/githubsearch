import 'package:flutter/material.dart';
import 'package:flutter_template/models/item.dart';

class RepositoryItem extends StatelessWidget {
  Item item;

  RepositoryItem({this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(item.name,
              style: TextStyle(color: Colors.black, fontSize: 16.0)),
          Text(item.url, style: TextStyle(color: Colors.grey, fontSize: 13.0)),
          Divider(color: Colors.grey[600],)
        ],
      ),
    );
  }
}
