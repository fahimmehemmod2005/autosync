import 'package:get/get.dart';

class PinController extends GetxController {
  var pin = ''.obs;

  void updatePin(String value) {
    pin.value = value;
  }

  bool isPinLengthValid() {
    return pin.value.length == 6;
  }
}
