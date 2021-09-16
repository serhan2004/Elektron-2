import 'package:get/get.dart';

class ppfotocontroller extends GetxController {
  var _ppfotolink =
      "https://i.pinimg.com/originals/f9/e4/d9/f9e4d92f175e120ac1840a29095e3646.jpg"
          .obs;

  get ppfotolink => _ppfotolink.value;
  set ppfotolink(yenideger) => _ppfotolink.value = yenideger;
}
