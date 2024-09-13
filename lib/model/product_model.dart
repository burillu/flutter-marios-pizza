class ProductModel {
  final String imageUrl;
  final String name;
  final double price;
  bool inShoppingCart;

  ProductModel({
    required this.imageUrl,
    required this.name,
    required this.price,
    this.inShoppingCart = false,
  });
}

final products = [
  ProductModel(
    imageUrl:
        "https://upload.wikimedia.org/wikipedia/commons/c/c8/Pizza_Margherita_stu_spivack.jpg",
    name: "Pizza margherita",
    price: 5,
  ),
  ProductModel(
    imageUrl:
        "https://static.cookist.it/wp-content/uploads/sites/21/2021/05/Pasta-gamberi-e-pomodorini-638x425.jpg",
    name: "Pasta ai gamberi",
    price: 8,
  ),
  ProductModel(
    imageUrl:
        "https://www.mammeincucina.it/wp-content/uploads/2021/02/EVIDENZA-1.jpg",
    name: "Cuori di pasta fresca",
    price: 7,
  ),
  ProductModel(
    imageUrl:
        "https://cdn.diredonna.it/app/uploads/2014/01/Ricette-dietetiche-scaloppine-al-limone-54452801_7dfe8b59aa_z-650x480.jpg",
    name: "Scaloppine al limone",
    price: 12,
  ),
  ProductModel(
    imageUrl:
        "https://blog.giallozafferano.it/loti64/wp-content/uploads/2019/02/IMG_9593.jpg",
    name: "Pollo alle olive",
    price: 13,
  ),
  ProductModel(
    imageUrl:
        "https://www.sfizioso.it/wp-content/uploads/2019/12/Arrosto-allarancia_0003.jpg",
    name: "Arrosto all'arancia",
    price: 21,
  ),
  ProductModel(
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2OI2AUZFOUqSOBUb5pyFSKhQatawaE3YudA&s",
    name: "Pizza alla Carbonara",
    price: 9.50,
  ),
  ProductModel(
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5kwbI1-BQL3RBxAAISeeDWSTy2TrTNWdq9w&s",
    name: "Pizza Mediterranea",
    price: 9.50,
  ),
];
