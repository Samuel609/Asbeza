class Item {
  String foodTile;
  String foodDescription;
  String image;
  num foodPrice;

  Item(
      {required this.foodTile,
      required this.foodDescription,
      required this.image,
      required this.foodPrice});

  factory Item.fromJson(Map<String, dynamic> parsedJson) {
    return Item(
        foodTile: parsedJson['title'],
        foodDescription: parsedJson['description'],
        foodPrice: parsedJson['price'],
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
