import 'package:EarlybazeWallet/app/export.dart';

import '../model/faq_data_model.dart';
import '../model/faq_response_model.dart';

class FaqController extends GetxController{

  List<Map<String,dynamic>> list=[];
  bool isExpanded = false;
  int selectedIndex = 0;
  int? activeMeterIndex;
  List<FaqDataModel> faqList = [];
  bool isLoading = false;
  int page = 1;
  FaqResponseModel faqResponseModel = FaqResponseModel();





  @override
  void onReady() {
    hitFaqListAPI(1);
    update();
    super.onReady();
  }



  hitFaqListAPI(page) {
    isLoading = true;
    APIRepository.faqListApiCall(page).then((value) async {
      isLoading = false;
      if (value != null) {
        faqResponseModel = value;
        if (page == 1) {
          faqList.clear();
          for (int i = 0; i < (faqResponseModel.data?.length ?? 0); i++) {
            faqList.add(faqResponseModel.data![i]);
          }
        } else {
          if (faqResponseModel.data?.length != 0) {
            isLoading = false;
            faqList.addAll(faqResponseModel.data!);
          }
        }
        update();
      }
    }).onError((error, stackTrace) {
      isLoading = false;
      debugPrint("error");
      showInSnackBar(message: error.toString());
    });
  }


}