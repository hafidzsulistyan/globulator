import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:globulator/app/modules/bmi/controllers/bmi_controller.dart';
import 'package:globulator/app/routes/app_pages.dart';

class BMIView extends GetView<BMIController> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    final heightApp = Get.height -
        context.mediaQueryPadding.top -
        context.mediaQueryPadding.bottom;
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Container(
        height: heightApp * 0.07,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.HOME),
            icon: Icon(
              Icons.home,
            )
          ),
          IconButton(
            onPressed: () => Get.toNamed(Routes.BMI),
            icon: Icon(
              Icons.monitor_weight
            )
          ),
          IconButton(
            onPressed: () => Get.toNamed(Routes.BILL),
            icon: Icon(
              Icons.attach_money
            )
          )
        ]),
      ),
    );
  }
}
