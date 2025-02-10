import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petadoption/models/Pet.dart';

class CartItem extends StatelessWidget {
  final Pet pet;
  const CartItem({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(
          horizontal: 10, vertical: 5),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        title: Text(
          pet.name,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle:
        Text("Age: ${pet.age} • Price: \$${pet.price}"),
        leading: Hero(
          tag: 'photo_${pet.image}',
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(pet.image,
                width: 60, height: 60, fit: BoxFit.cover),
          ),
        ),
        trailing: pet.isAdopted
            ? Icon(Icons.check_circle, color: Colors.green)
            : Icon(Icons.pets, color: Colors.grey),
        // onTap: () {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) =>
        //             DetailsScreen(pet: pet)),
        //   );
        // },
      ),
    );
  }
}
