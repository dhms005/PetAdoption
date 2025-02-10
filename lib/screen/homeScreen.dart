import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petadoption/blocs/petBloc.dart';
import 'package:petadoption/blocs/petState.dart';
import 'package:petadoption/screen/detailScreen.dart';
import 'package:petadoption/screen/historyScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pet Adoption")),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search for a pet...",
                prefixIcon: const Icon(Icons.search),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onChanged: (query) {
                setState(() {
                  searchQuery = query.toLowerCase();
                });
              },
            ),
          ),

          // Pet List
          Expanded(
            child: BlocBuilder<PetBloc, PetState>(
              builder: (context, state) {
                if (state is PetLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is PetLoaded) {
                  // Filter pets based on search query
                  final filteredPets = state.pets
                      .where(
                          (pet) => pet.name.toLowerCase().contains(searchQuery))
                      .toList();

                  if (filteredPets.isEmpty) {
                    return const Center(child: Text("No matching pets found"));
                  }

                  return ListView.builder(
                    itemCount: filteredPets.length,
                    itemBuilder: (context, index) {
                      final pet = filteredPets[index];

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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.history),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HistoryPage()),
          );
        },
      ),
    );
  }
}
