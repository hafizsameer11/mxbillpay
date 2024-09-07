import 'package:EarlybazeWallet/app/export.dart';
import 'package:EarlybazeWallet/app/modules/Gallery/Model/gallery_images_response_model.dart';
import 'package:EarlybazeWallet/app/modules/chat/Model/chat_list_response_model.dart';

class ViewGalleryScreenController extends GetxController {
  Receiver? receiver;
  List<ImageListDataModel> imageList = [];

  galleryApiCall() {
    APIRepository().galleryApiCall(agentId: receiver!.id).then((value) async {
      GalleryListResponseModel galleryListResponseModel = value;
      if ((galleryListResponseModel.data ?? []).length > 0) {
        imageList = galleryListResponseModel.data ?? [];
        print("length======> ${imageList.length}");
      }
      update();
    }).onError((error, stackTrace) {
      showInSnackBar(message: error.toString());
    });
  }

  @override
  void onReady() {
    if (Get.arguments != null) {
      receiver = Get.arguments;
      galleryApiCall();
    }

    super.onReady();
  }
}
