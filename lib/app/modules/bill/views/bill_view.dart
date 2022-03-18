import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:globulator/app/core/theme.dart';
import 'package:globulator/app/routes/app_pages.dart';
import 'package:globulator/app/modules/bill/controllers/bill_controller.dart';
import 'package:globulator/app/modules/bill/widgets/item_button_custom.dart';

class BillView extends GetView<BillController> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    final heightApp = Get.height -
        context.mediaQueryPadding.top -
        context.mediaQueryPadding.bottom;
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SafeArea(
        child: Container(
          child: ListView(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            children: <Widget>[
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
              Container(
                margin: const EdgeInsets.only(top: 60.0),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  children: <Widget>[
                    TextField(
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        hintText: "10000",
                        labelStyle: TextStyle(
                          color: context.theme.primaryColor
                        ),
                        labelText: "Bill Amount",
                        prefixIcon: Icon(
                          Icons.attach_money,
                          color: context.theme.primaryColor,
                          ),
                      ),
                      onEditingComplete: () =>
                        Get.obs,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Split",
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                        Row(
                          children: <Widget>[
                            ItemButtonCustom(
                              text: '-',
                              value: '-'
                            ),
                            Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Obx(
                                () => Text(
                                '${controller.personCounter.value}',
                                ),
                              ),
                            ),
                            ItemButtonCustom(
                              text: '+',
                              value: '+'
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Tip',
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Obx(
                            () => Text(
                            '${controller.tipAmount.value}'
                            ),
                          )
                        )
                      ],
                    ),
                    //Slider
                    Column(
                      children: <Widget>[
                        Obx(
                          () => Text(
                            '${controller.tipPercentage.value}',
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ),
              SizedBox(
                height: 48,
              ),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    color: context.theme.primaryColor,
                    borderRadius: BorderRadius.circular(12.0)),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Total Per Person',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Obx(
                        () => Text(
                          '${controller.totalBill.value}',
                        )
                      )
                    ],
                  ),
                ),
              ),
            ]
          ),
        )
      )
    );
  }

}