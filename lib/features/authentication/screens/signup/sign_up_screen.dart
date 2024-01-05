import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:http/http.dart';
import 'package:t_store/features/authentication/screens/addFarm/addfarm.dart';
import 'package:t_store/features/authentication/screens/login2/widgets/main_page.dart';
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

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    firstNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future signUp() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
              color: Color.fromARGB(212, 50, 121, 20),
            ),
          );
        });
    // auth
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    // add user info
    await addUserData(firstNameController.text.trim(),
        lastNameController.text.trim(), 'user');
    Get.off(MainPage());
  }

  Future addUserData(String firstName, String lastName, String userType) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first_name': firstName,
      'last_name': lastName,
      'userType': userType,
    });
  }

  void showTermsAndService() {
    showDialog(
        context: context,
        builder: (context) => const TermsOfServices(
              mdFileName: 'terms_of_service.md',
            ));
  }

//  intial data
  Map userData = {
    'userId': '',
    'userName': '',
    'userEmail': '',
    "Password": '',
    "UserType": ''
  };
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
                    controller: firstNameController,
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
                    controller: lastNameController,
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
              controller: emailController,
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
                controller: passwordController,
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
                  activeColor: const Color.fromARGB(212, 50, 121, 20),
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
              signUp();
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

class User {
  final String UserID;
  final String Name;
  final String Email;
  final String Password;
  final String UserType;
  User({
    required this.UserID,
    required this.Name,
    required this.Email,
    required this.Password,
    required this.UserType,
  });
}
