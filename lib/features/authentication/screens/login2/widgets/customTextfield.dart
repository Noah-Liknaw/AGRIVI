import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class CustomTextField extends StatelessWidget {
  final double width;
  final double height;
  final TextFormField textFormField;
  const CustomTextField(
      {super.key,
      required this.textFormField,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8, left: 5),
      width: width,
      height: height,
      decoration: BoxDecoration(
          border: Border.all(
            color: TColors.darkGrey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4)),
      child: Center(child: textFormField),
    );
  }
}
