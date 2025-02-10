import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petadoption/utils/appColors.dart';
import 'package:petadoption/widgetUI/textNexaFont.dart';

class NormalButton extends StatelessWidget {
  final String text;
  final Color backColor;

  const NormalButton({
    Key? key,
    required this.text,
    this.backColor = const Color(0xFF31bcdd),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 0, bottom: 0, left: 15, right: 15),
      padding: const EdgeInsets.only(top: 7, bottom: 7, left: 5, right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: backColor,
      ),
      child: Center(
        child: TextNexaFont(
          fontColor: AppColors.mainWhiteColor,
          title: text,
        ),
      ),
    );
  }
}
