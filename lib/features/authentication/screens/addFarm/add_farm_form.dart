import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'package:t_store/utils/constants/colors.dart';

class AddFarmForm extends StatefulWidget {
  AddFarmForm({super.key});

  @override
  State<AddFarmForm> createState() => _AddFarmFormState();
}

class _AddFarmFormState extends State<AddFarmForm> {
  final farmNameController = TextEditingController();

  final locationController = TextEditingController();
  @override
  void dispose() {
    farmNameController.dispose();
    locationController.dispose();
    super.dispose();
  }

  bool isLoading = false;
  Future addFarm() async {
    setState(() {
      isLoading = true;
    });
    await saveFarm(
        farmNameController.text.trim(), locationController.text.trim());
    setState(() {
      isLoading = false;
    });
    farmNameController.clear();
    locationController.clear();
  }

  Future saveFarm(String farmName, String location) async {
    await FirebaseFirestore.instance.collection('farms').add({
      'farm_name': farmName,
      'location': location,
    });
  }

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
                    child: const Icon(Icons.arrow_back),
                  ),
                  const Text("Add Farm"),
                  !isLoading
                      ? GestureDetector(
                          onTap: addFarm,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(212, 50, 121, 20),
                                borderRadius: BorderRadius.circular(5)),
                            child: const Text(
                              'Save',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      : const Center(
                          child: CircularProgressIndicator(
                            color: const Color.fromARGB(212, 50, 121, 20),
                          ),
                        )
                ],
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              TextFormField(
                controller: farmNameController,
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
                controller: locationController,
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
