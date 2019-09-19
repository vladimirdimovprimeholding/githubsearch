import 'package:flutter/material.dart';
import 'package:flutter_template/models/list_items.dart';
import 'package:flutter_template/widgets/repository_item.dart';

import 'empty_list.dart';

class RepositoriesList extends StatelessWidget {
  final listItems;

  RepositoriesList({this.listItems});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ListItems>(
        stream: listItems,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData && !snapshot.hasError) {
            var listItems = (snapshot.data as ListItems).list;
            if (listItems.length > 0) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: listItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return RepositoryItem(
                      item: listItems[index],
                    );
                  });
            }
          }

          return EmptyList();
        });
  }
}
