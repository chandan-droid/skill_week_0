import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model.dart';

class CalenderPageController extends GetxController{
  var schedules = <Schedule>[].obs;
  var isLoading = true.obs;

  Future<void> getSchedule() async {
    try {
      const String userUrl = "https://scheduleapi-7rkx.onrender.com/API/get";
      final response = await http.get(Uri.parse(userUrl));
      if (response.statusCode == 200) {
        final List result = jsonDecode(response.body);
        schedules.value = result.map((e) => Schedule.fromJson(e)).toList();
        isLoading.value = false;
        update();
      } else {
        Get.snackbar('Error Loading data!',
            'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
      }
    } catch (e) {
    // Handle other errors like network issues
    print('Error fetching schedule: $e');
    }
  }

  @override
  void onInit() {
    super.onInit();
    getSchedule();
  }
}