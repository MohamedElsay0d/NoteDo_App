import 'package:get/get.dart';
import 'package:notedo_app/themes/theme_data.dart';

class ChangeAppThemeController extends GetxController {
  RxBool isDarkTheme = true.obs;

  void changeTheme() {
    isDarkTheme.value = !isDarkTheme.value;
    Get.changeTheme(isDarkTheme.value ? lightTheme : darkTheme);

    print(isDarkTheme);
  }
}
