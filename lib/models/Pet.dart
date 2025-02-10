class Pet {
  final String name;
  final String age;
  final String image;
  final bool isAdopted;
  final String price;

  Pet({
    required this.name,
    required this.age,
    required this.image,
    required this.isAdopted,
    required this.price,
  });

  factory Pet.fromMap(Map<String, dynamic> data) {
    return Pet(
      name: data['name'] ?? '',
      age: data['age'] ?? '',
      image: data['image'] ?? '',
      isAdopted: data['isAdopted'] ?? false,
      price: data['price'] ?? '',
    );
  }
}
