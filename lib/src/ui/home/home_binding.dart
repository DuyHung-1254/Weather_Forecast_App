import 'package:get/instance_manager.dart';
import 'package:thirty_widgets/src/ui/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(city: '京都市'));
  }
}
