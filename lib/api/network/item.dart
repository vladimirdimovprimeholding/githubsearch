class Item {
  int id;
  String name;
  String url;

  Item({this.id, this.name, this.url});

  factory Item.fromJson(Map<String, dynamic> parsedJson) {
    return Item(
      id: parsedJson["id"],
      name: parsedJson["name"],
      url: parsedJson["url"],
    );
  }
}
