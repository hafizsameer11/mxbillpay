
import '../../../export.dart';

class MainScreenBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<MainScreenController>(() => MainScreenController());
  }
}
