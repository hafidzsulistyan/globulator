import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:globulator/app/modules/bmi/controllers/bmi_controller.dart';

class BMIView extends GetView<BMIController> {
  @override
  Widget build (BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(

    );
  }
}