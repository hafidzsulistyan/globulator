import 'package:get/get.dart';

class BillController extends GetxController {
  var billAmount = 0.0.obs;
  var personCounter = 1.obs;
  var tipPercentage = 0.obs;
  var tipAmount = 0.0.obs;
  var totalBill = 0.0.obs;

  void calculateTotalPerPerson(double billAmount, int splitBy, int tipPercentage) {
    totalBill.value = (tipAmount.value + billAmount) / splitBy;
  }

  void calculateTotalTip(double billAmount, int tipPercentage) {
    if (billAmount > 0) {
      tipAmount.value = (billAmount * tipPercentage) / 100;
    }
  }

  void updatePersonCount(String data) {
    if (data == "+") {
      personCounter.value++;
    } else if (data == "-") {
      personCounter.value--;
    }
  }
}