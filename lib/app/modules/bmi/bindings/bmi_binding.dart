import 'package:get/get.dart';
import 'package:globulator/app/modules/bmi/controllers/bmi_controller.dart';

class BMIBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BMIController>(
      () => BMIController(),
    );
  }
}