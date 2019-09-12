import 'package:flutter/material.dart';
import 'package:flutter_template/models/item.dart';
import 'package:flutter_template/models/list_items.dart';
import 'package:flutter_template/services/repositories_service.dart';
import 'package:flutter_template/widgets/repository_item.dart';

class RepositoriesList extends StatelessWidget {
  String name;

  RepositoriesList({this.name});

  @override
  Widget build(BuildContext context) {
    var stream = RepositoryService().getRepositoriesWithName(name);
    return StreamBuilder<ListItems>(
        stream: stream,
        initialData: ListItems(list: List<Item>()),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          var listItems;
          if (snapshot != null && (snapshot.data as ListItems) != null) {
            listItems = (snapshot.data as ListItems).list;
            // Handle empty state
            if (listItems == null || listItems.length == 0) {
              return _emptyListView();
            }
          } else {
            return _emptyListView();
          }

          return ListView.builder(
              shrinkWrap: true,
              itemCount: listItems.length,
              itemBuilder: (BuildContext context, int index) {
                return RepositoryItem(
                  item: listItems[index],
                );
              });
        });
  }

  /**
   * Create an empty list view with separators
   */
  Widget _emptyListView() {
    return ListView.separated(
      itemCount: 20,
      itemBuilder: (context, index) {
        return ListTile(
          title: Spacer(),
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }
}
