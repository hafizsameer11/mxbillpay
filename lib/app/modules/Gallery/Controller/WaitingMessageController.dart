import 'package:EarlybazeWallet/app/export.dart';

import '../../home/model/ServicesResponseModel.dart';

class WaitingMessageController extends GetxController {
  APIRepository apiRepository = Get.put(APIRepository());
  bool findingAgent = true;

  bool isSearching = true;
  DateTime dateTime = DateTime.now();
  ServiceDataModel? argumentModel;

  @override
  void onReady() {
    super.onReady();
    if (Get.arguments != null) {
      argumentModel = Get.arguments;
      getServices((Get.arguments).id);
    }
  }

  void getServices(String serviceId) {
    update();
    int actualTime = (DateTime.now().difference(dateTime).inSeconds);
    int aproximateTime = (Duration(seconds: 30).inSeconds);
    if (actualTime > aproximateTime) {
      isSearching = false;
      update();
    }
    APIRepository.findAgentApiCall(service_id: serviceId).then((value) {
      isSearching = false;
      showInSnackBar(message: value.message ?? "");
      Get.offNamed(AppRoutes.MessagingScreen, arguments: {"isFromChat": true, "receiverDetails": value.selectedAgentData});
      isSearching = false;
      update();
    }, onError: (error) {
      print(error);
      if (isSearching) {
        isSearching = true;
        update();
        Future.delayed(
          Duration(seconds: 3),
          () {
            getServices(serviceId);
          },
        );
      }
    });
  }
}
