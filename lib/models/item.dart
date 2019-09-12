import 'package:flutter_template/api/network/item.dart' as network;

class Item {
  String name;
  String url;

  Item({this.name, this.url});

  factory Item.fromNetworkItem(network.Item networkItem) {
    return Item(
      name: networkItem.name,
      url: networkItem.url,
    );
  }
}
