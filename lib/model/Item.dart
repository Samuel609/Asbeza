class Item {
  String name;
  int price;
  String img;

  Item({
    required this.name, 
    required this.price, 
    required this.img
    });

  factory Item.fromJson(Map<String, dynamic> parsedJson) {
    return Item(
        name: parsedJson['name'],
        price: parsedJson['price'],
        img: parsedJson['img']
    );
  }
}
