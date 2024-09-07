import 'package:intl_phone_field/countries.dart';

import '../../../data/models/response_model/sign_up_response_model.dart';
import '../../../export.dart';

class ProfileSetupController extends GetxController {
  String idImage = '';
  String profileImage = '';
  FocusNode firstNameFocusNode = FocusNode();
  FocusNode lastNameFocusNode = FocusNode();
  FocusNode phoneNUmberFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode countryFocusNode = FocusNode();
  FocusNode stateFocusNode = FocusNode();
  FocusNode cityFocusNode = FocusNode();
  TextEditingController? firstNameController = TextEditingController();
  TextEditingController? lastNameController = TextEditingController();
  TextEditingController? phoneNumberController = TextEditingController();
  TextEditingController? emailController = TextEditingController();
  TextEditingController? dobTextController = TextEditingController();
  TextEditingController? addressTextController = TextEditingController();
  TextEditingController? countyController = TextEditingController();
  TextEditingController? stateController = TextEditingController();
  TextEditingController? cityController = TextEditingController();
  LoginDataModel? loginDataModel;
  String? pickDate;
  Rx<Country>? selectedCountry = Country(
    name: "Nigeria",
    flag: "🇳🇬",
    code: "NG",
    dialCode: "234",
    minLength: 10,
    maxLength: 11,
  ).obs;

  @override
  void onReady() {
    preferenceManger.getSavedLoginData().then((value) {
      loginDataModel = value;
      firstNameController!.text = loginDataModel!.firstName ?? "";
      lastNameController!.text = loginDataModel!.lastName ?? "";
      phoneNumberController!.text = loginDataModel!.mobileNo ?? "";
      emailController!.text = loginDataModel!.email ?? "";
      dobTextController!.text = loginDataModel!.dob ?? "";
      selectedCountry!.value.code != loginDataModel!.countryCode;
      profileImage = loginDataModel!.profilePic ?? "";
      idImage = loginDataModel?.idPhoto ?? "";

      countyController!.text = loginDataModel!.country ?? "";
      stateController!.text = loginDataModel!.state ?? "";
      cityController!.text = loginDataModel!.city ?? "";
      update();
    }).onError((err, st) {});
  }

  updateImageFile(Future<PickedFile?> imagePath) async {
    PickedFile? file = await imagePath;
    if (file != null) {
      idImage = file.path;
      update();
    }
  }

  updateProfileImageFile(Future<PickedFile?> imagePath) async {
    PickedFile? file = await imagePath;
    if (file != null) {
      profileImage = file.path;
      update();
    }
  }

  updateProfileAPI() async {
    MultipartFile? idMutiprtImage;
    MultipartFile? profileImageMutiprtImage;
    print(idImage != '');
    if (idImage != '') {
      if (idImage.contains("http") == false) {
        idMutiprtImage =
            await MultipartFile.fromFile(idImage, filename: idImage);
      }
    }
    if (profileImage != '' || (!profileImage.contains("http"))) {
      if (profileImage.contains("http") == false) {
        profileImageMutiprtImage =
            await MultipartFile.fromFile(profileImage, filename: profileImage);
      }
    }
    final requestModel = AuthRequestModel.profileRequestData(
      firstName: firstNameController?.text.trim(),
      lastName: lastNameController?.text.trim(),
      email: emailController?.text.trim(),
      contact: phoneNumberController?.text.trim(),
      country: countyController?.text.trim(),
      state: stateController?.text.trim(),
      city: cityController?.text.trim(),
      profilePicture: profileImageMutiprtImage,
      idPicture: idMutiprtImage,
      countryCode: selectedCountry?.value.dialCode.toString(),
      countryIsoCode: selectedCountry?.value.code,
      dob: dobTextController?.text.trim(),
    );
    APIRepository.updateProfileApiCall(dataBody: await requestModel)
        .then((value) async {
      if (value != null) {
        LoginResponseModel loginResponseModel = value;
        preferenceManger.saveRegisterData(loginResponseModel.data);
        if (Get.arguments != null) {
          Get.offAllNamed(AppRoutes.mainScreen);
        } else {
          Get.back(result: true);
        }
        showInSnackBar(message: loginResponseModel.message.toString());
        Get.put(MainScreenController()).getProfileData();
        update();
      }
    }).onError((error, stackTrace) {
      showInSnackBar(message: error.toString());
    });
  }
}
