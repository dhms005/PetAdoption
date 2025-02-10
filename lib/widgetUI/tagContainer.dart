import 'package:flutter/material.dart';
import 'package:petadoption/utils/appColors.dart';
import 'package:petadoption/widgetUI/textNexaFont.dart';

class TagContainer extends StatelessWidget {
  final String title;
  final bool isBlue;

  const TagContainer({
    super.key,
    required this.title,
    this.isBlue = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      padding: const EdgeInsets.only(right: 5, bottom: 5, left: 5, top: 5),
      decoration: BoxDecoration(
        color: isBlue ? AppColors.blueBg : AppColors.yellowBg,
        // Background color
        borderRadius: BorderRadius.circular(5), // Rounded corners
      ),
      child: TextNexaFont(
        title: title,
        fontColor: isBlue ? AppColors.blueText : AppColors.yellowText,
        fontSize: 10,
      ),
    );
  }
}
