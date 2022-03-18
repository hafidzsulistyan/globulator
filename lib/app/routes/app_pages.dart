import 'package:get/get.dart';
import 'package:globulator/app/modules/bill/bindings/bill_binding.dart';
import 'package:globulator/app/modules/bill/views/bill_view.dart';
import 'package:globulator/app/modules/home/bindings/home_binding.dart';
import 'package:globulator/app/modules/home/views/home_view.dart';
import 'package:globulator/app/modules/bmi/bindings/bmi_binding.dart';
import 'package:globulator/app/modules/bmi/views/bmi_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.BILL,
      page: () => BillView(),
      binding: BillBinding(),
    ),
    GetPage(
      name: _Paths.BMI,
      page: () => BMIView(),
      binding: BMIBinding(),
    ),
  ];
}
