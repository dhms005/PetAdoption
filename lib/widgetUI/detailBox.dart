import 'package:flutter/material.dart';
import 'package:petadoption/utils/appColors.dart';
import 'package:petadoption/widgetUI/textNexaFont.dart';

class DetailBox extends StatelessWidget {
  final String title;
  final String titleValue;

  const DetailBox({
    super.key,
    required this.title, required this.titleValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      padding: const EdgeInsets.only(right: 5, bottom: 10, left: 5, top: 5),
      decoration: BoxDecoration(
        color: AppColors.darkBlueBg,
        // Background color
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      child: Column(
        children: [
          TextNexaFont(
            title: titleValue,
            fontColor: AppColors.darkBlueText,
            fontSize: 18,
            isBold: true,
          ),
          const SizedBox(height: 2,),
          TextNexaFont(
            title: title,
            fontColor: AppColors.darkBlueText,
            fontSize: 10,
          ),
        ],
      ),
    );
  }
}
