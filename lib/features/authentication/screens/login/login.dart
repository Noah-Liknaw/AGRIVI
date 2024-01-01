import 'package:flutter/material.dart';
import 'package:t_store/common/styles/spacing_styles.dart';
import 'package:t_store/common/widgets/Login_Signup/form_divider.dart';
import 'package:t_store/common/widgets/Login_Signup/social_buttons.dart';
import 'package:t_store/features/authentication/screens/login/widgets/login_form.dart';
import 'package:t_store/features/authentication/screens/login/widgets/login_header.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: TSpacingStlye.paddingWithAppBarHeight,
        child: Column(
          children: [
            //head
            TLoginHeader(),

            //form
            TLoginForm(),
            // Divider
            TFormDivder(divderText: TTexts.orSignInWith),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            TSocialButtons(),
          ],
        ),
      ),
    ));
  }
}
