class Item {
  int id;
  String title;
  String desc;
  String image;
  num Price;
  int quantity;
  int addItem;

  Item(
      {required this.id,
      required this.title,
      required this.desc,
      required this.image,
      required this.Price,
      required this.quantity,
      required this.addItem});

  factory Item.fromJson(Map<String, dynamic> parsedJson) {
    return Item(
        id: parsedJson["id"],
        title: parsedJson['title'],
        desc: parsedJson['description'],
        Price: parsedJson['price'],
        image: parsedJson['image'],
        quantity: 1,
        addItem: 0);
  }

  factory Item.HistfromJson(Map<String, dynamic> parsedJson) {
    return Item(
        id: parsedJson["id"],
        title: parsedJson['title'],
        desc: parsedJson['desc'],
        Price: parsedJson['price'],
        image: parsedJson['image'],
        quantity: parsedJson["quantity"],
        addItem: parsedJson["addItem"]);
  }

  toJson() {
    Map<String, dynamic> json = {};
    json["id"] = id;
    json['title'] = title;
    json['desc'] = desc;
    json['Price'] = Price;
    json['image'] = image;
    json['quantity'] = quantity;
    json['addItem'] = addItem;
    return json;
  }

  static List groceryList(List itemss) {
    List items = [];
    for (var i = 0; i < itemss.length; i++) {
      items.add(Item.fromJson(itemss[i]));
    }
    return items;
  }

  static List histList(List itemss) {
    List items = [];
    for (var i = 0; i < itemss.length; i++) {
      items.add(Item.HistfromJson(itemss[i]));
    }
    return items;
  }
}
