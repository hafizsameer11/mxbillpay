
import '../../../export.dart';

class SplashBindings extends Bindings {  @override
  void dependencies() {
  Get.lazyPut<SplashController>(() => SplashController());
  }
}
