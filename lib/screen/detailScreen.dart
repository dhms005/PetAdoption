import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petadoption/blocs/petBloc.dart';
import 'package:petadoption/blocs/petEvent.dart';
import 'package:petadoption/utils/appColors.dart';
import 'package:petadoption/widgetUI/detailBox.dart';
import 'package:petadoption/widgetUI/normalButton.dart';
import 'package:petadoption/widgetUI/textNexaFont.dart';

import '../models/Pet.dart';

class DetailsScreen extends StatelessWidget {
  final Pet pet;

  const DetailsScreen({required this.pet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pet.name)),
      body: Container(
        color: AppColors.mainBgColor,
        child: Column(
          children: [
            Hero(
                tag: 'photo_${pet.image}',
                child: Image.network(pet.image,
                    width: double.infinity, height: 200, fit: BoxFit.cover)),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  TextNexaFont(
                    title: pet.name,
                    fontColor: AppColors.darkBlueText,
                    fontSize: 18,
                    isBold: true,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: Colors.grey,
                    size: 15,
                  ),
                  TextNexaFont(
                    title: pet.address,
                    fontColor: AppColors.mainBlackColor,
                    fontSize: 12,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DetailBox(title: "Age", titleValue: pet.age),
                DetailBox(title: "Gender", titleValue: pet.gender),
                DetailBox(title: "Price", titleValue: "\$${pet.price}"),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: TextNexaFont(
                title: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                fontColor: AppColors.mainBlackColor,
                fontSize: 12,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            pet.isAdopted
                ?
            // Text("Already Adopted", style: TextStyle(color: Colors.red))
            const NormalButton(
              text: "Already Adopted",
              backColor: AppColors.disabledButtonColor,
            )
                : GestureDetector(
                    onTap: () {
                      context.read<PetBloc>().add(AdoptPet(pet.name));
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(
                          content: Text("You’ve adopted ${pet.name}"),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                    child: const NormalButton(
                      text: "Adopt Me",
                      backColor: AppColors.mainColor,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
