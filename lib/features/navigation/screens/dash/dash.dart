import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:t_store/common/widgets/bottombar.dart';
import 'package:t_store/features/navigation/controllers/home_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';

const LatLng currentLocation = LatLng(25.1193, 55.3773);

class Dash extends StatelessWidget {
  final DashController controller = Get.put(DashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => FlashyTabBar(
            selectedIndex: controller.selectedIndex.value,
            showElevation: true,
            onItemSelected: (index) {
              controller.setSelectedIndex(index);
            },
            items: [
              FlashyTabBarItem(
                icon: Icon(Icons.event),
                title: Text('Home'),
              ),
              FlashyTabBarItem(
                icon: Icon(Icons.analytics_outlined),
                title: Text('Analytics'),
              ),
              FlashyTabBarItem(
                icon: Icon(Icons.people_alt),
                title: Text('Growers'),
              ),
              FlashyTabBarItem(
                icon: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ],
          )),
    );
  }
}
