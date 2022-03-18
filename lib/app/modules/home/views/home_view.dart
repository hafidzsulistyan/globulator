import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:globulator/app/core/theme.dart';
import 'package:globulator/app/modules/home/controllers/home_controller.dart';
import 'package:globulator/app/routes/app_pages.dart';
import 'package:globulator/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    final heightApp = Get.height -
        context.mediaQueryPadding.top -
        context.mediaQueryPadding.bottom;
    final widthApp = Get.width;
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
          child: Column(
            children: [
              Container(
                height: heightApp * 0.07,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
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
                  ]
                ),
              ),
              Expanded(
                child: Container(
                  width: widthApp,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 50),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Obx(
                          () => Text(
                            "${controller.hasil}",
                            style: TextStyle(
                              fontSize: 70,
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => Text(
                          "${controller.text}",
                          style: TextStyle(
                            fontSize: 25,
                            color: context.theme.accentColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                    ],
                  ),
                ),
              ),
              Container(
                width: widthApp,
                height: heightApp * 0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ItemButtonCustom(
                          text: "AC",
                          value: "AllClear",
                        ),
                        ItemButtonCustom(
                          text: "⌫",
                          value: "Clear",
                        ),
                        ItemButtonCustom(
                          text: "^",
                          value: "^",
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(10),
                          elevation: 7,
                          color: context.theme.primaryColor,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () => Get.changeTheme(
                              Get.isDarkMode ? light : dark,
                            ),
                            child: Container(
                              width: Get.width * 0.165,
                              height: Get.width * 0.165,
                              child: Center(
                                child: Icon(
                                  Icons.color_lens_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ItemButtonCustom(
                          text: "(",
                          value: "(",
                        ),
                        ItemButtonCustom(
                          text: ")",
                          value: ")",
                        ),
                        ItemButtonCustom(
                          text: "%",
                          value: "%",
                        ),
                        ItemButtonCustom(
                          text: "÷",
                          value: "/",
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ItemButtonCustom(
                          text: "7",
                          value: "7",
                        ),
                        ItemButtonCustom(
                          text: "8",
                          value: "8",
                        ),
                        ItemButtonCustom(
                          text: "9",
                          value: "9",
                        ),
                        ItemButtonCustom(
                          text: "x",
                          value: "*",
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ItemButtonCustom(
                          text: "4",
                          value: "4",
                        ),
                        ItemButtonCustom(
                          text: "5",
                          value: "5",
                        ),
                        ItemButtonCustom(
                          text: "6",
                          value: "6",
                        ),
                        ItemButtonCustom(
                          text: "-",
                          value: "-",
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ItemButtonCustom(
                          text: "1",
                          value: "1",
                        ),
                        ItemButtonCustom(
                          text: "2",
                          value: "2",
                        ),
                        ItemButtonCustom(
                          text: "3",
                          value: "3",
                        ),
                        ItemButtonCustom(
                          text: "+",
                          value: "+",
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ItemButtonCustom(
                          text: "0",
                          value: "0",
                        ),
                        ItemButtonCustom(
                          text: ".",
                          value: ".",
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(10),
                          elevation: 7,
                          color: context.theme.primaryColor,
                          child: InkWell(
                            onTap: () => controller.eksekusi(),
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              width: Get.width * 0.165 * 2.45,
                              height: Get.width * 0.165,
                              child: Center(
                                child: const Text(
                                  "=",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemButtonCustom extends GetView<HomeController> {
  const ItemButtonCustom({
    Key? key,
    required this.text,
    required this.value,
  }) : super(key: key);

  final String text;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      elevation: 7,
      color: context.theme.backgroundColor,
      child: InkWell(
        onTap: () {
          controller.changeText(value);
        },
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: Get.width * 0.165,
          height: Get.width * 0.165,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
