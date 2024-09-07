import 'package:EarlybazeWallet/app/export.dart';

import '../../../data/models/response_model/static_page_response_model.dart';

class StaticPageController extends GetxController{
  int? isType = 0;
  StaticPageResponseModel staticPageResponseModel=StaticPageResponseModel();

  hitStaticPagesAPI() {
    customLoader.show(Get.overlayContext);
    APIRepository.staticPageApiCall(typeId: isType).then((value) async {
      customLoader.hide();
      if (value != null) {
         staticPageResponseModel = value;
         debugPrint("Static Page :::::: ${staticPageResponseModel.data?.content}");

        update();
      }
    }).onError((error, stackTrace) {
      customLoader.hide();
     showInSnackBar(message: error.toString());
    });
  }
  @override
  void onInit() {
    if (Get.arguments != null) {
      isType = Get.arguments['static'];
    }
    super.onInit();
  }
  @override
  void onReady() {
    hitStaticPagesAPI();
    super.onReady();
  }
}