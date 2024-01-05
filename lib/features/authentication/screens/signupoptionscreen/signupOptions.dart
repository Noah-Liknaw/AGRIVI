import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:t_store/features/authentication/screens/login2/login_screen.dart';
import 'package:t_store/features/authentication/screens/login2/widgets/main_page.dart';
import 'package:t_store/features/authentication/screens/signup/sign_up_screen.dart';
import 'package:t_store/features/authentication/screens/signupoptionscreen/widgets/appname.dart';
import 'package:t_store/features/authentication/screens/signupoptionscreen/widgets/signup_buttons.dart';

import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class SignUpOptions extends StatelessWidget {
  const SignUpOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(TImages.bgImage),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Color.fromARGB(107, 35, 35, 35), BlendMode.darken),
          )),
          child: Column(children: [
            const SizedBox(
              height: TSizes.buttonWidth,
            ),
            SizedBox(
                height: TSizes.buttonWidth,
                child: Image.asset(TImages.logoTransparent)),
            const AppLogoName(),
            const SizedBox(
              height: TSizes.iconMd,
            ),
            const Text(
              TTexts.moto,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(
              height: TSizes.buttonWidth + 30,
            ),
            SignUpMethodsButtonRed(
              text: TTexts.signupWithE,
              onpressed: () {
                Get.to(SignupScreen());
              },
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            SignUpMethodsButton(
              iconAdress: TImages.google,
              signupText: TTexts.signupWithG,
              onPressed: () {},
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            SignUpMethodsButton(
              iconAdress: TImages.facebook,
              signupText: TTexts.signupWithF,
              onPressed: () {},
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            SignUpMethodsButton(
              iconAdress: TImages.appleLogo,
              signupText: TTexts.signupWithA,
              onPressed: () {},
            ),
            const SizedBox(
              height: TSizes.iconMd + 5,
            ),
            TextButton(
                onPressed: () {
                  Get.to(MainPage());
                },
                child: const Text(
                  TTexts.login,
                  style: TextStyle(
                      fontSize: TSizes.fontSizeSm,
                      color: Colors.white,
                      fontWeight: FontWeight.w800),
                ))
          ]),
        ),
      ),
    );
  }
}
