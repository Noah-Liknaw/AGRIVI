import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:http/http.dart';
import 'package:t_store/features/authentication/screens/addFarm/addfarm.dart';
import 'package:t_store/features/authentication/screens/signup/widgets/custom_continue_button.dart';
import 'package:t_store/features/authentication/screens/signup/widgets/terms_of_services.dart';
import 'package:t_store/features/authentication/screens/signup/widgets/text_field.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool initialValue = false;

  void checkBoxOnchange(bool value) {
    setState(() {
      initialValue = value;
    });
  }

  void showTermsAndService() {
    showDialog(
        context: context,
        builder: (context) => const TermsOfServices(
              mdFileName: 'terms_of_service.md',
            ));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * 0.1,
          ),
          const Text(TTexts.signupTitle),
          SizedBox(
            height: size.height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomeTextField(
                  textFormField: TextFormField(
                    decoration: const InputDecoration(
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: TTexts.firstName,
                        hintStyle:
                            TextStyle(color: TColors.darkGrey, fontSize: 14)),
                  ),
                  width: size.width * 0.4,
                  height: size.height * 0.07),
              CustomeTextField(
                  textFormField: TextFormField(
                    decoration: const InputDecoration(
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: TTexts.lastName,
                        hintStyle:
                            TextStyle(color: TColors.darkGrey, fontSize: 14)),
                  ),
                  width: size.width * 0.4,
                  height: size.height * 0.07),
            ],
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          CustomeTextField(
            textFormField: TextFormField(
              decoration: const InputDecoration(
                  enabledBorder: InputBorder.none,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: TTexts.email,
                  hintStyle: TextStyle(color: TColors.darkGrey, fontSize: 14)),
            ),
            width: size.width,
            height: size.height * 0.07,
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          CustomeTextField(
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
          Row(
            children: [
              Checkbox(
                  value: initialValue,
                  onChanged: (value) {
                    checkBoxOnchange(value!);
                  }),
              RichText(
                text: TextSpan(
                    text: "I have read and agree to farmable's",
                    style: const TextStyle(
                      fontSize: 10,
                      color: TColors.black,
                    ),
                    children: [
                      TextSpan(
                        text: 'Terms of Service.',
                        style: const TextStyle(
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            showTermsAndService();
                          },
                      )
                    ]),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          CustomContinueButton(
            onPressed: () {
              Get.to(AddFarm());
            },
            width: size.width,
            height: size.height * 0.05,
            text: 'Continue',
          ),
        ],
      ),
    ));
  }
}
