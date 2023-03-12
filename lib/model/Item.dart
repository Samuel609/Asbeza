class Item {
  String title;
  String desc;
  String image;
  num Price;

  Item(
      {required this.title,
      required this.desc,
      required this.image,
      required this.Price});

  factory Item.fromJson(Map<String, dynamic> parsedJson) {
    return Item(
        title: parsedJson['title'],
        desc: parsedJson['description'],
        Price: parsedJson['price'],
        image: parsedJson['image']);
  }

  static List groceryList(List itemss) {
    List items = [];
    for (var i = 0; i < itemss.length; i++) {
      items.add(Item.fromJson(itemss[i]));
    }
    return items;
  }
}
