import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:t_store/features/navigation/controllers/home_controller.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({
    super.key,
    required this.controller,
  });

  final DashController controller;

  @override
  Widget build(BuildContext context) {
    return FlashyTabBar(
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
    );
  }
}
