import '../../../export.dart';
import '../model/ServicesResponseModel.dart';

class HomeScreenController extends GetxController {
  final PreferenceManger _preferenceManger = Get.put(PreferenceManger());
  final APIRepository _repository = Get.put(APIRepository());
  LoginDataModel loginDataModel = LoginDataModel();

  List<ServiceDataModel> serviceDataModel = [];

  @override
  void onInit() {
    getProfileData();
    super.onInit();
  }

  @override
  void onReady() {
    getServiceList();
  }

  getProfileData() async {
    _preferenceManger.getSavedLoginData().then((value) {
      if (value != null) {
        loginDataModel = value;
        update();
      }
    });
  }

  void getServiceList() {
    _repository.getServicesListAPICall("1").then((value) {
      serviceDataModel.clear();
      serviceDataModel.addAll(value.serviceDataModel!);
      update();
    }, onError: (error,st) {
      showInSnackBar(message: "error");
    });
  }
}
