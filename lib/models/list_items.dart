import 'package:flutter_template/api/network/result.dart';
import 'package:flutter_template/models/item.dart';

class ListItems {
  List<Item> list;

  ListItems({this.list});

  factory ListItems.fromApiResult(ApiResult apiResult) {
    var result = apiResult.items.map((networkItem) {
      return Item.fromNetworkItem(networkItem);
    }).toList();
    return ListItems(list: result);
  }
}