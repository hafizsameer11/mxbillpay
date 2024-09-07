import '../../../export.dart';

class ResetPasswordController extends GetxController {
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  final formGlobalKey = GlobalKey<FormState>();
  late FocusNode passwordFocusNode;
  late FocusNode confirmPasswordFocusNode;

  @override
  void onInit() {
    initController();
    super.onInit();
  }

  initController() {
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    passwordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();

    passwordFocusNode.addListener(() {
      update();
    });

    confirmPasswordFocusNode.addListener(() {
      update();
    });
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  void validate() {
    if (formGlobalKey.currentState!.validate()) {
      Get.toNamed(AppRoutes.loginScreen);
    }
  }
}
