import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentication/screens/signup/widgets/custom_continue_button.dart';
import 'package:t_store/features/authentication/screens/signup/widgets/text_field.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_strings.dart';
import 'widgets/customTextfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            const Text(
              TTexts.loginTitle,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            CustomTextField(
                textFormField: TextFormField(
                  decoration: const InputDecoration(
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: TTexts.email,
                      hintStyle:
                          TextStyle(color: TColors.darkGrey, fontSize: 14)),
                ),
                width: size.width,
                height: size.height * 0.07),
            SizedBox(
              height: size.height * 0.03,
            ),
            CustomTextField(
                textFormField: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: TTexts.password,
                      hintStyle:
                          TextStyle(color: TColors.darkGrey, fontSize: 14)),
                ),
                width: size.width,
                height: size.height * 0.07),
            SizedBox(
              height: size.height * 0.01,
            ),
            SizedBox(
              width: size.width,
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Forget Password?',
                      style: const TextStyle(
                          color: TColors.black,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()..onTap = () {})
                ]),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            CustomContinueButton(
              onPressed: () {},
              width: size.width,
              height: size.height * 0.05,
              text: 'Continue',
            ),
          ],
        ),
      ),
    );
  }
}
