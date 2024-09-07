import '../../../export.dart';
import '../controller/notification_controller.dart';

class NotificationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<NotificationController>(() => NotificationController());
  }
}