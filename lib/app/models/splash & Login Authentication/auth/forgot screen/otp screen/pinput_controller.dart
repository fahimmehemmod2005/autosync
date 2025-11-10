import 'package:get/get.dart';

class PinController extends GetxController {
  final String correctPin = '1234';

  var enteredPin = ''.obs;

  void updatePin(String pin) {
    enteredPin.value = pin;
  }

  bool isPinLengthValid() {
    return enteredPin.value.length == 4;
  }
  bool isPinValid() {
    return enteredPin.value == correctPin;
  }
}