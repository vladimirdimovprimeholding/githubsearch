import 'package:flutter_template/api/network/item.dart';

class ApiResult {
  int totalCount;
  bool incompleteResults;
  List<Item> items;

  ApiResult({this.totalCount, this.incompleteResults, this.items});

  factory ApiResult.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson["items"] as List;
    List<Item> items = list.map((i) => Item.fromJson(i)).toList();
    return ApiResult(
      totalCount: parsedJson["total_count"],
      incompleteResults: parsedJson["incomplete_results"],
      items: items,
    );
  }
}
