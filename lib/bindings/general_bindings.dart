import 'package:get/get.dart';
import 'package:survey_five/utils/connects/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies(){
    Get.put(NetworkManager());
  }
}