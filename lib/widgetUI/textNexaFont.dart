import 'package:flutter/widgets.dart';
import 'package:petadoption/utils/appColors.dart';

class TextNexaFont extends StatelessWidget {
  final String title;
  final bool isBold;
  final bool isItalic;
  final double fontSize;
  final Color fontColor;

  const TextNexaFont(
      {super.key,
      required this.title,
      this.isBold = false,
      this.isItalic = false,
      this.fontSize = 18,
      this.fontColor = AppColors.mainColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: fontColor,
        fontSize: fontSize,
        fontFamily: 'Noto Sans',
        // Specify font family explicitly
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
      ),
    );
  }
}
