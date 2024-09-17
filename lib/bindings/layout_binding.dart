import 'package:get/get.dart';
import 'package:skill_week_0/controllers/layout_controller.dart';
import '../controllers/Calender_page_controller.dart';
import '../controllers/home_page_controller.dart';

class LayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LayoutController>(() => LayoutController());
    Get.lazyPut<HomePageController>(() => HomePageController());
    Get.lazyPut<CalenderPageController>(() => CalenderPageController());
  }

}