import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petadoption/models/Pet.dart';
import 'package:petadoption/utils/appColors.dart';
import 'package:petadoption/widgetUI/tagContainer.dart';
import 'package:petadoption/widgetUI/textNexaFont.dart';

class MainListItem extends StatelessWidget {
  final Pet pet;

  const MainListItem({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: AppColors.mainWhiteColor, // Background color
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Hero(
            tag: 'photo_${pet.image}',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(pet.image,
                  width: 90, height: 90, fit: BoxFit.cover),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextNexaFont(
                    title: pet.name,
                    fontColor: AppColors.mainBlackColor,
                    isBold: true,
                    fontSize: 16,
                  ),
                  // const SizedBox(
                  //   height: 2,
                  // ),
                  Row(
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
                  Row(
                    children: [
                      TagContainer(title: pet.gender),
                      TagContainer(
                        title: pet.age,
                        isBlue: false,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          pet.isAdopted
              ? const Icon(Icons.check_circle, color: Colors.green)
              : const Icon(Icons.pets, color: Colors.grey)
        ],
      ),
    );
  }
}
