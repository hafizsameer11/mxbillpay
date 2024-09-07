
import '../../../export.dart';

class HomeScreenBindings extends Bindings {  @override
  void dependencies() {
   Get.lazyPut<HomeScreenController>(() => HomeScreenController());
  }
}
