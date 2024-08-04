import 'package:get/get.dart';

class HomeController extends GetxController {
  final List<String> tabsList = ['Notes', 'Todos'];
  var currentIndex = 0.obs;
  var title = 'Notes'.obs;
  var floatingButtonText = 'Add Note'.obs;

  void onTabChange(int index) {
    currentIndex.value = index;
    title.value = tabsList[index];
    floatingButtonText.value =
        'Add ${(tabsList[index]).substring(0, (tabsList[index]).length - 1)}';
  }
}
