import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petadoption/blocs/petBloc.dart';
import 'package:petadoption/blocs/petState.dart';
import 'package:petadoption/screen/detailScreen.dart';
import 'package:petadoption/widgetUI/mainListItem.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("History Pet Adoption")),
      body: Column(
        children: [
          // Pet List
          Expanded(
            child: BlocBuilder<PetBloc, PetState>(
              builder: (context, state) {
                if (state is PetLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is PetLoaded) {
                  final filteredPets =
                      state.pets.where((pet) => pet.isAdopted == true).toList();

                  if (filteredPets.isEmpty) {
                    return const Center(child: Text("No Pet Adoption found"));
                  }

                  return ListView.builder(
                    itemCount: filteredPets.length,
                    itemBuilder: (context, index) {
                      final pet = filteredPets[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                              builder: (context) =>
                              DetailsScreen(pet: pet)),
                          );
                        },
                        child: MainListItem(pet: pet),);

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
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(pet.image,
                                width: 60, height: 60, fit: BoxFit.cover),
                          ),
                          trailing: pet.isAdopted
                              ? Icon(Icons.check_circle, color: Colors.green)
                              : Icon(Icons.pets, color: Colors.grey),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsScreen(pet: pet)),
                            );
                          },
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text("No pets available"));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
