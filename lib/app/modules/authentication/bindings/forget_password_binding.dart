
import '../../../export.dart';

class ForgetPasswordBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<ForgetPasswordController>(() => ForgetPasswordController());
  }

}