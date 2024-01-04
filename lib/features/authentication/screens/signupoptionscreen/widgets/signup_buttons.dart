import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class SignUpMethodsButton extends StatelessWidget {
  final String iconAdress;
  final String signupText;
  final VoidCallback onPressed;
  const SignUpMethodsButton(
      {super.key,
      required this.iconAdress,
      required this.signupText,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: TSizes.signupOptionButtonWidth,
        height: TSizes.signupOptionButtonHeight,
        decoration: BoxDecoration(
            color: TColors.white,
            borderRadius: BorderRadius.circular(TSizes.borderRadiusMd)),
        child: Row(children: [
          const SizedBox(width: TSizes.iconSm),
          SizedBox(height: TSizes.iconLg, child: Image.asset(iconAdress)),
          const SizedBox(width: TSizes.iconLg + 10),
          Text(
            signupText,
            style: const TextStyle(
              fontSize: TSizes.fontSizeMd,
              fontWeight: FontWeight.w800,
              color: TColors.black,
            ),
          ),
        ]),
      ),
    );
  }
}

class SignUpMethodsButtonRed extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;
  const SignUpMethodsButtonRed(
      {super.key, required this.text, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        width: TSizes.signupOptionButtonWidth,
        height: TSizes.signupOptionButtonHeight,
        decoration: BoxDecoration(
            color: const Color.fromARGB(212, 50, 121, 20),
            borderRadius: BorderRadius.circular(TSizes.borderRadiusMd)),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            text,
            style: const TextStyle(
                fontSize: TSizes.fontSizeMd,
                fontWeight: FontWeight.w800,
                color: TColors.white),
          ),
        ]),
      ),
    );
  }
}
