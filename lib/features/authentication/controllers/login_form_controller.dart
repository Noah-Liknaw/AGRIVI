import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:t_store/features/dashboard/screens/dashboard.dart';
import 'package:t_store/features/fitness_app/fitness_app_home_screen.dart';
import 'package:t_store/features/navigation/screens/dash/dash.dart';

class LoginFormController extends GetxController {
  var isLoading = false.obs; // Observe the loading state

  void signIn() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));
    isLoading.value = false;
    Get.off(DashBoard());
  }
}
