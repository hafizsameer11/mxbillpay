import 'package:EarlybazeWallet/app/core/utils/replace_http_extension.dart';
import 'package:EarlybazeWallet/app/export.dart';
import 'package:EarlybazeWallet/app/modules/chat/Model/EndChatResponseModel.dart';
import 'package:EarlybazeWallet/app/modules/chat/Model/chat_list_response_model.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../authentication/models/auth_request_model.dart';
import '../Model/LoadChatResponseModel.dart';
import '../Model/message_window_response_model.dart';

class MessagingController extends GetxController {
  TextEditingController editingController = TextEditingController();
  int page = 1;
  String? remotePDFpath;
  int maxTime = 0;
  LoginDataModel? loginDataModel;
  LoadChatResponseModel? loadChatResponseModel;
  MessageWindowResponseModel? messageWindowResponseModel;
  ScrollController scrollController = ScrollController();
  List<MessageWindowData> messageWindowList = [];
  EndChatResponseModel endChatResponseModel = EndChatResponseModel();

  File? idImage;
  var fileUrl;
  var fileId;
  var fileType;
  var type;
  var typeId;
  var id;

  String? fileName;
  var start = 20;
  bool isChatEnded = false;
  bool isFromChat = true;
  Timer? timer;
  ReceiverData receiverData = ReceiverData();
  String messageType = "1";

  @override
  void onInit() {
    paginateItemList();
    super.onInit();
  }

  getArguments() async {
    if (Get.arguments != null) {
      receiverData = Get.arguments['receiverDetails'];
      isFromChat = Get.arguments['isFromChat'] ?? false;
      update();
    }
  }

  @override
  void onReady() {
    getArguments();
    getProfileData();
    loadChatList();
    // getNewMessage();
    timer = Timer.periodic(
      Duration(seconds: 2),
      (timer) => getNewMessage(),
    );
    super.onReady();
  }

  getProfileData() {
    preferenceManger.getSavedLoginData().then((value) {
      loginDataModel = value;
      update();
    });
  }

  getNewMessage() {
    final requestModal = RequestModal.loadChatRequestModal(
        receiver_id: receiverData.receiver?.id,
        service_id: receiverData.service!.id,
        page: "",
        per_page: "20");
    APIRepository.loadChatApiCall(dataBody: requestModal).then((value) {
      loadChatResponseModel = value;
      if (value.messages != null) {
        if (value.messages!.length != 0) {
          value.messages!.forEach((element) {
            int index = messageWindowList.indexWhere((oldMessageElement) =>
                element.id.toString().toLowerCase() ==
                oldMessageElement.id.toString().toLowerCase());
            if (index == -1) {
              messageWindowList.insert(0, element);
            }
          });
          scroll();
          update();
        }
      }
      update();
    }, onError: (error) {
      showInSnackBar(message: error.toString());
    });
  }

  loadChatList() {
    final requestModal =
        RequestModal.messageWindowRequestModal(chat_id: receiverData.id);
    try {
      APIRepository.messageWindowApiCall(
          dataBody: requestModal,
          queryParameter: {"page": page, "per_page": "15"}).then((value) async {
        messageWindowResponseModel = value;
        receiverData.receiver!.fullName =
            messageWindowResponseModel!.otherUser!.fullName;
        receiverData.receiver!.profilePic =
            messageWindowResponseModel!.otherUser!.profilePic;
        if (page == 1) {
          if (value.chatId!.length != 0) {
            messageWindowList.addAll(messageWindowResponseModel!.data!);
            update();
          }
        } else {
          if (value.chatId!.length != 0) {
            messageWindowList.addAll(messageWindowResponseModel!.data!);
            update();
          }
        }
        update();
      });
    } catch (e, stack) {
      print("Error$e");
      print("Error${stack}");
    }
  }

  paginateItemList() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if ((messageWindowResponseModel!.meta!.currentPageNo!) <
            (messageWindowResponseModel!.meta!.pageCount!)) {
          page++;
          loadChatList();
        }
      }
    });
  }

  Future<MultipartFile?> convertToMultipart(String filePath) async {
    MultipartFile? profileMultipartImage;
    if (filePath != "") {
      profileMultipartImage =
          await MultipartFile.fromFile(filePath, filename: filePath);
    }
    return profileMultipartImage;
  }

  void scroll() {
    scrollController.animateTo(0.0,
        duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  void hitToSendMessage() async {
    final requestModal = RequestModal.sendMessageRequestModal(
      message: editingController.text.toString().trim(),
      message_type: messageType,
      messageFile:
          idImage == null ? null : await convertToMultipart(idImage!.path),
      receiverId: receiverData.receiver?.id,
      serviceId: receiverData.service!.id,
    );
    APIRepository().sendMessagesApiCall(dataBody: requestModal).then((value) {
      messageWindowList.insert(0, value.messages!);
      editingController.clear();
      scroll();
      update();
    }, onError: (error) {
      showInSnackBar(message: error);
    });
  }

  updateProfileImageFile(Future<PickedFile?> imagePath) async {
    PickedFile? file = await imagePath;
    if (file != null) {
      idImage = File(file.path);
      messageType = "2";
      editingController.text = "";
      hitToSendMessage();
      update();
    }
  }

  endChatApiCall() {
    final requestModel =
        RequestModal.chatEndRequestMOdel(chatId: receiverData.id, endChat: '1');
    APIRepository.endChatApiCall(dataBody: requestModel).then((value) {
      if (value != null) {
        endChatResponseModel = value;
        Get.toNamed(AppRoutes.mainScreen);

        showInSnackBar(message: endChatResponseModel.message ?? '');
      }
    }).onError((error, stackTrace) {
      showInSnackBar(message: error.toString());
    });
  }

  saveNetworkImage(String path) async {
    if (path.trim().isEmpty) {
      return;
    }
    var response = await Dio()
        .get(path.replaceHttp(), options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 60,
        name: "hello");
    if (result != null) {
      showInSnackBar(message: "Image downloaded");
    }
  }

  Future<void> openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx', 'xls']);
    if (result != null) {
      idImage = File(result.files.single.path.toString());
      debugPrint("file:::${idImage}");
      messageType = "2";
      hitToSendMessage();
    } else {
      showInSnackBar(message: "No document selected");
    }
  }

  void openDocument(url) async {
    debugPrint("open document::::");
    getPermission([Permission.storage, Permission.manageExternalStorage]);
    if (await Permission.manageExternalStorage.isGranted ||
        await Permission.storage.isGranted) {
      FileDownloader.downloadFile(
          url: url.toString().replaceHttp(),
          name: url.toString().split("=").last,
          //THE FILE NAME AFTER DOWNLOADING,
          onProgress: (String? fileName, double progress) {
            print('FILE fileName HAS PROGRESS $progress');
          },
          onDownloadCompleted: (String path) async {
            showInSnackBar(message: "Document downloaded");
            print('FILE DOWNLOADED TO PATH: $path');
            final result = await OpenFile.open(path);
            if (result.type == ResultType.noAppToOpen) {
              showInSnackBar(message: 'No App Found To Open This File');
            }
          },
          onDownloadError: (String error) {
            print('DOWNLOAD ERROR: $error');
          });
    }
  }

  static Future getPermission(List<Permission> permissionType,
      {bool isOpenSetting = true}) {
    return permissionType.request().then((value) {
      value.forEach((key, value) async {
        switch (value) {
          case PermissionStatus.denied:
            await key.request();
            break;
          case PermissionStatus.granted:
            break;
          case PermissionStatus.restricted:
            await key.request();
            break;
          case PermissionStatus.limited:
            await key.request();

            break;
          case PermissionStatus.permanentlyDenied:
            await key.request();

            if (isOpenSetting) openAppSettings();
            break;
          case PermissionStatus.provisional:
            // TODO: Handle this case.
            break;
        }
      });
    });
  }
}
