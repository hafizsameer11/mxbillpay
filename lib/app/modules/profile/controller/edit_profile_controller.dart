
import '../../../export.dart';

class EditProfileController extends GetxController{
  final formGlobalKey=GlobalKey<FormState>();
  RxString imagePath=''.obs;
  TextEditingController? firstNameTextController;
  TextEditingController? lastNameTextController;
  TextEditingController? emailTextController;
  TextEditingController? contactTextController;
  TextEditingController? addressTextController;

  Future getImageCamera() async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      imagePath.value = image.path.toString();
    }
  }

  Future getImageGallary() async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath.value = image.path.toString();
    }
  }

  void validate() {
    if (formGlobalKey.currentState!.validate()) {
      Get.back();
    }
  }

  // userRegisterApiCall() async {
  //   final requestModel = AuthRequestModel.profileRequestData(
  //       firstName: firstNameTextController?.text.trim(),
  //       lastName: lastNameTextController?.text.trim()
  //       , email: emailTextController?.text.trim(),
  //       contact: contactTextController?.text.trim());
  //   APIRepository.updateProfileApiCall(dataBody: await requestModel).then((value) async {
  //
  //     if (value != null) {
  //       LoginResponseModel loginResponseModel = value;
  //        // preferenceManger.saveRegisterData(loginResponseModel.userData);
  //       Get.back();
  //       showInSnackBar(message: "strInfoUpdated");
  //     }
  //   }).onError((error, stackTrace) {
  //     showInSnackBar(message: error.toString());
  //   });
  // }
  inIt(){
    firstNameTextController = TextEditingController(text: preferenceManger.loginData.value.fullName);
  contactTextController = TextEditingController(text: preferenceManger.loginData.value.mobileNo);
  emailTextController =TextEditingController(text: preferenceManger.loginData.value.email);
}

@override
  void onInit() {
  inIt();
  super.onInit();
  }


}