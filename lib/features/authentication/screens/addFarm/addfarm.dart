import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:t_store/features/authentication/screens/addFarm/invitePeople.dart';
import 'package:t_store/features/authentication/screens/signupoptionscreen/widgets/signup_buttons.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class AddFarm extends StatelessWidget {
  const AddFarm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        Padding(
          padding: EdgeInsets.only(left: TSizes.lg),
          child: IconButton(
              onPressed: () {
                Get.to(const InvitePeopleScreen());
              },
              icon: const Icon(Icons.more_vert)),
        ),
        const SizedBox(
          width: TSizes.md,
        )
      ]),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: TSizes.iconSm),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                TTexts.wellcome,
                style: TextStyle(
                    fontSize: TSizes.fontSizeLg + 5,
                    fontWeight: FontWeight.bold,
                    color: TColors.black),
              ),
              Text(
                TTexts.greeting,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: TSizes.fontSizeSm + 1.3,
                    fontWeight: FontWeight.w500,
                    color: TColors.black),
              ),
              SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              Text(
                TTexts.farmQuestion,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: TSizes.fontSizeSm + 1.3,
                    fontWeight: FontWeight.w500,
                    color: TColors.black),
              ),
              SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              SignUpMethodsButtonRed(
                text: TTexts.addFarm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}