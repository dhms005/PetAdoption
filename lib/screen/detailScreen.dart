import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petadoption/blocs/petBloc.dart';
import 'package:petadoption/blocs/petEvent.dart';

import '../models/pet.dart';

class DetailsScreen extends StatelessWidget {
  final Pet pet;

  const DetailsScreen({required this.pet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pet.name)),
      body: Column(
        children: [
          Hero(
              tag: 'photo_${pet.image}',
              child: Image.network(pet.image,
                  width: double.infinity, height: 200, fit: BoxFit.cover)),
          Text("Age: ${pet.age}", style: TextStyle(fontSize: 18)),
          Text("Price: \$${pet.price}", style: TextStyle(fontSize: 18)),
          pet.isAdopted
              ? Text("Already Adopted", style: TextStyle(color: Colors.red))
              : ElevatedButton(
                  onPressed: () {
                    context.read<PetBloc>().add(AdoptPet(pet.name));
                    Navigator.pop(context);
                  },
                  child: Text("Adopt Me"),
                ),
        ],
      ),
    );
  }
}
