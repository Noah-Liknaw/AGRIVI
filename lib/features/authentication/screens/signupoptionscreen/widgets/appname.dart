import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';

class AppLogoName extends StatelessWidget {
  const AppLogoName({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "AGRIVI",
      style: TextStyle(
          color: TColors.white,
          fontSize: 32,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w500),
    );
  }
}
