import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'package:t_store/utils/constants/colors.dart';

class AddFarmForm extends StatelessWidget {
  const AddFarmForm({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back),
                  ),
                  const Text("Add Farm"),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(212, 50, 121, 20),
                        borderRadius: BorderRadius.circular(5)),
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: -10, horizontal: 10),
                    label: Text('Farm Name'),
                    labelStyle:
                        TextStyle(color: TColors.darkGrey, fontSize: 14)),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: -10, horizontal: 10),
                    label: Text('Location'),
                    labelStyle:
                        TextStyle(color: TColors.darkGrey, fontSize: 14)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
