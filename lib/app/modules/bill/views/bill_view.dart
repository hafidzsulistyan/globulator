import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:globulator/app/core/theme.dart';

import '../controllers/bill_controller.dart';
import '../widgets/item_button_custom.dart';

class BillView extends GetView<BillController> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
          alignment: Alignment.center,
          child: ListView(
            padding: const EdgeInsets.all(20.0),
            children: <Widget>[
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.lightBlue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12.0)),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Total Per Person',
                        style: TextStyle(
                          color: context.theme.primaryColor,
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
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  children: <Widget>[
                    TextField(
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      style: TextStyle(color: context.theme.primaryColor),
                      decoration: InputDecoration(
                        hintText: "10000",
                        labelText: "Bill Amount",
                        prefixIcon: Icon(Icons.attach_money)
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
                            Obx(
                              () => Text(
                              '${controller.personCounter.value}',
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
              )
            ]
          ),
        )
      )
    );
  }

}