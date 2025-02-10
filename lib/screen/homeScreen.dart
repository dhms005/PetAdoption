import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petadoption/blocs/petBloc.dart';
import 'package:petadoption/blocs/petState.dart';
import 'package:petadoption/screen/detailScreen.dart';
import 'package:petadoption/screen/historyScreen.dart';
import 'package:petadoption/utils/appColors.dart';
import 'package:petadoption/widgetUI/cartItem.dart';
import 'package:petadoption/widgetUI/mainListItem.dart';

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
      body: Container(
        color: AppColors.mainBgColor,
        child: Column(
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
                        final petItem = filteredPets[index];

                        return GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MainListItem(pet: petItem),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsScreen(pet: petItem)),
                            );
                          },
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
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.history),
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
