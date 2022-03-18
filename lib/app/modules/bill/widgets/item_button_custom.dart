import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/bill_controller.dart';

class ItemButtonCustom extends GetView<BillController> {
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
          controller.updatePersonCount(value);
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