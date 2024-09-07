
import '../../../export.dart';


class ProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangePasswordController>(() => ChangePasswordController());
    Get.lazyPut<EditProfileController>(() => EditProfileController());
    Get.lazyPut<ProfileController>(() => ProfileController());


  }
}