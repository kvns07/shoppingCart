class Products {
  Products({
    required this.name,
    required this.image,
    this.price,
    required this.count
  });

  String name;
  String image;
  int? price;
  int count;

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
    "price":price,
    "count":count,
  };
}
