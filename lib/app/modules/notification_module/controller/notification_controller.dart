import 'package:EarlybazeWallet/app/export.dart';
import 'package:EarlybazeWallet/app/modules/notification_module/model/delete_notification_response_model.dart';

import '../model/clear_all_response_model.dart';
import '../model/notification_response_model.dart';
import '../model/read_notification_response_model.dart';

class NotificationController extends GetxController {
  List<NotificationData> notificationList = [];
  DeleteNotificationResponseModel deleteNotificationResponseModel = DeleteNotificationResponseModel();
  int index = -1;

  @override
  void onReady() {
    notificationListApi();
  }

  notificationListApi() {
    customLoader.show(Get.overlayContext);
    APIRepository.notificationListApiCall(page: 1).then((value) async {
      customLoader.hide();
      if (value != null) {
        NotificationResponseModel notificationResponseModel = value;
        notificationList = notificationResponseModel.data ?? [];
        update();
      }
    }).onError((error, stackTrace) {
      customLoader.hide();
    });
  }

  clearAllNotificationApi() {
    APIRepository.notificationClearApi().then((value) async {
      ClearAllResponseModel clearAllResponseModel = value;
      notificationListApi();
      showInSnackBar(message: clearAllResponseModel.message.toString());
      update();
    }).onError((error, stackTrace) {
      debugPrint("error");
      showInSnackBar(message: error.toString());
    });
  }

  deleteNotificationApiCall(id) {
    var requestModel = {"notification_id": id};
    APIRepository.deleteNotificationApiCall(dataBody: requestModel).then((value) async {
      DeleteNotificationResponseModel deleteResponseModel = value;
      notificationListApi();
      showInSnackBar(message: deleteResponseModel.message.toString());
      update();
    }).onError((error, stackTrace) {
      debugPrint("error");
      showInSnackBar(message: error.toString());
    });
  }

  isReadNotificationApiCall(id) {
    var requestModel = {"notification_id": id};

    APIRepository.readNotificationApiCall(dataBody: requestModel).then((value) async {
      ReadResponseModel readResponseModel = value;

      notificationListApi();
      update();
    }).onError((error, stackTrace) {
      debugPrint("error");
      showInSnackBar(message: error.toString());
    });
  }
}








