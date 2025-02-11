class Pet {
  final String name;
  final String age;
  final String image;
  bool isAdopted;
  final String price;
  final String address;
  final String gender;

  Pet({
    required this.name,
    required this.age,
    required this.image,
    required this.isAdopted,
    required this.price,
    required this.address,
    required this.gender,
  });

  factory Pet.fromMap(Map<String, dynamic> data) {
    return Pet(
      name: data['name'] ?? '',
      age: data['age'] ?? '',
      image: data['image'] ?? '',
      isAdopted: data['isAdopted'] ?? false,
      price: data['price'] ?? '',
      address: data['address'] ?? '',
      gender: data['gender'] ?? '',
    );
  }

  //
  void adopt() {
    isAdopted = true;
  }


}
