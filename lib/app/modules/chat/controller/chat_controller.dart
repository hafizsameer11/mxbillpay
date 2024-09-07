import 'package:EarlybazeWallet/app/export.dart';
import 'package:EarlybazeWallet/app/modules/chat/Model/chat_list_response_model.dart';

class ChatController extends GetxController {
  ChatListResponseModel chatResponseModel = ChatListResponseModel();
  final APIRepository _apiRepository = Get.find<APIRepository>();
  ScrollController scrollController = ScrollController();
  List<ReceiverData> userList = [];
  int page = 1;
  var start = 30;

  @override
  void onInit() {
    chatApiCall();
    super.onInit();
  }

  onReady() {
    paginateItemList();
    super.onReady();
  }

  paginateItemList() {
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        if (page < chatResponseModel.meta!.pageCount!) {
          page++;
          chatApiCall();
        }
      }
    });
  }

  chatApiCall() async {
    await _apiRepository.chatApiCall(page: page, search: '', perPage: '').then((value) {
      if (value != null) {
        chatResponseModel = value;
        if (page == 1) {
          userList.clear();
          userList = chatResponseModel.data ?? [];
        } else {
          userList.addAll(chatResponseModel.data ?? []);
        }
      }
      update();
    });
  }
}
