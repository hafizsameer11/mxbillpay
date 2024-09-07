import '../../../export.dart';

class ResetPasswordBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<ResetPasswordController>(() => ResetPasswordController());
  }
}
