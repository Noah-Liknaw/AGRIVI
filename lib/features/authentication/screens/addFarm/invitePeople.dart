import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:t_store/features/authentication/screens/addFarm/widget/listItems.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class InvitePeopleScreen extends StatelessWidget {
  const InvitePeopleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            TTexts.invite,
            style: TextStyle(
                fontWeight: FontWeight.w800, fontSize: TSizes.fontSizeMd),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.iconSm),
          child: ListView(
            children: const [
              ListItems(
                title: TTexts.crew,
                subtitle: TTexts.crewDescription,
              ),
              Divider(
                height: TSizes.sm,
              ),
              ListItems(
                title: TTexts.advisor,
                subtitle: TTexts.advisorDescription,
              ),
              Divider(
                height: TSizes.sm,
              ),
              ListItems(
                title: TTexts.manager,
                subtitle: TTexts.manaerDescription,
              ),
              Divider(
                height: TSizes.sm,
              )
            ],
          ),
        ));
  }
}
