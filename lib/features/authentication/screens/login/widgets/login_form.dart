import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/controllers/login_form_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginFormController());
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            //email
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Iconsax.direct_right,
                ),
                labelText: TTexts.email,
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            //password
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: TTexts.password,
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields / 2,
            ),
            //Remeber Me  and Forgot Password
            Row(
              children: [
                //Remeber me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(TTexts.rememberMe),
                  ],
                ),
                //Forgot password
                TextButton(
                    onPressed: () {}, child: Text(TTexts.forgetPassword)),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            Obx(() {
              return SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    controller
                        .signIn(); 
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: controller
                            .isLoading.value, 
                        child: Image.asset(
                          TImages.loadingGif,
                          width: 30,
                        ),
                      ),
                      Text(TTexts.signIn)
                    ],
                  ),
                ),
              );
            }),
            //Sign in Button
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () {}, child: Text(TTexts.createAccount))),
          ],
        ),
      ),
    );
  }
}
