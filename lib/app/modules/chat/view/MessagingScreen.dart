import 'package:EarlybazeWallet/app/core/utils/replace_http_extension.dart';
import 'package:EarlybazeWallet/app/core/widget/custom_title_bar.dart';
import 'package:EarlybazeWallet/app/export.dart';
import 'package:EarlybazeWallet/app/modules/Gallery/ViewGalleryScreen.dart';
import 'package:EarlybazeWallet/app/modules/chat/controller/MessagingController.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../core/widget/image_picker_dialog.dart';
import '../Model/message_window_response_model.dart';

class MessagingScreen extends StatelessWidget {
  late MessagingController controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.put(MessagingController()),
        builder: (_controller) {
          controller = _controller;
          return WillPopScope(
            onWillPop: () async {
              if (controller.isFromChat) {
                Get.back(result: true);
              } else {
                Get.offAllNamed(AppRoutes.mainScreen);
              }
              Get.delete<MessagingController>();
              controller.timer!.cancel();
              return false;
            },
            child: Scaffold(
              appBar: CustomAppBar(
                leadingWidget: InkWell(
                  onTap: () {
                    print(controller.isFromChat);
                    if (controller.isFromChat) {
                      Get.back(result: true);
                    } else {
                      Get.offAllNamed(AppRoutes.mainScreen);
                    }
                    Get.delete<MessagingController>();
                    controller.timer!.cancel();
                  },
                  child: AssetImageWidget(
                    iconsIcBack,
                    imageHeight: height_15,
                  ).marginOnly(left: 20, right: 5),
                ),
              ),
              backgroundColor: appBlackColor,
              body: _bodyWidget(controller),
            ),
          );
        });
  }

  _bodyWidget(MessagingController controller) {
    return Column(
      children: [
        CustomTitleBar(
          appBarTitleText: controller.receiverData.service?.title ?? "",
        ),
        SizedBox(
          height: height_10,
        ),
        userProfileWidget(controller),
        Expanded(
          child: messageListView(controller),
        ),
        SizedBox(
          height: height_10,
        ),
        sendMessageWidget(controller),
      ],
    ).marginOnly(left: margin_12, right: margin_12);
  }

  userProfileWidget(MessagingController controller) {
    return SafeArea(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                NetworkImageWidget(
                    imageUrl:
                        controller.receiverData.receiver?.profilePic ?? '',
                    imageHeight: height_45,
                    radiusAll: radius_60,
                    placeHolder: iconsLogo,
                    imageWidth: height_45),
                Expanded(
                    child: TextView(
                            text: controller.receiverData.receiver?.fullName ??
                                "",
                            textAlign: TextAlign.start,
                            maxLine: 4,
                            textStyle: textStyleBody2()
                                .copyWith(fontSize: font_15, color: textColor))
                        .marginOnly(left: 20)),
                InkWell(
                    onTap: () {
                      Get.to(ViewGalleryScreen(),
                          arguments: controller.receiverData.receiver);
                    },
                    child: TextView(
                        text: strViewGallery,
                        textStyle: textStyleBody2().copyWith(
                            fontSize: font_11, color: appGreenColor))),
              ],
            )
          ],
        ),
      ).marginOnly(top: 10),
    );
  }

  leftSideMessageWidget(MessageWindowData messagesList) {
    final extension =
        messagesList.messageFile.toString().split('.').last.toLowerCase();
    return GestureDetector(
      onTap: () async {
        if (messagesList.messageType.toString() == "2") {
          if (messagesList.messageFile.toString().contains("pdf") ||
              messagesList.messageFile.toString().contains("doc") ||
              messagesList.messageFile.toString().contains("docx") ||
              messagesList.messageFile.toString().contains("xls")) {
            _showDocumentBottomSheet(messagesList.messageFile.toString());
          } else {
            _downloadImageBottomSheet(messagesList.messageFile.toString());
          }
        } else {
          Clipboard.setData(ClipboardData(text: messagesList.message!))
              .then((value) {
            print("printed--------------------------");
            showInSnackBar(message: 'Text copied');
          });
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(radius_50),
                  child: NetworkImageWidget(
                      imageUrl:
                          controller.receiverData.receiver?.profilePic ?? '',
                      imageHeight: height_40,
                      radiusAll: radius_50,
                      placeHolder: iconsLogo,
                      imageWidth: height_40)),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: margin_7),
                  decoration: BoxDecoration(
                      color: textFieldColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(radius_10),
                        topRight: Radius.circular(radius_10),
                        bottomRight: Radius.circular(radius_10),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      messagesList.messageType.toString() == "2"
                          ? ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(radius_10),
                                topRight: Radius.circular(radius_15),
                                bottomLeft: Radius.circular(radius_10),
                              ),
                              child: (messagesList.messageFile
                                          .toString()
                                          .contains("pdf") ||
                                      messagesList.messageFile
                                          .toString()
                                          .contains("doc") ||
                                      messagesList.messageFile
                                          .toString()
                                          .contains("docx") ||
                                      messagesList.messageFile
                                          .toString()
                                          .contains("xls"))
                                  ? Container(
                                      height: height_50,
                                      width: Get.width * 0.5,
                                      child: Icon(
                                        Icons.file_copy_rounded,
                                        color: Colors.grey,
                                        size: height_50,
                                      ),
                                    )
                                  : CachedNetworkImage(
                                      imageUrl: messagesList.messageFile
                                          .toString()
                                          .replaceHttp()),
                            ).marginOnly(right: 2, top: 2, left: 2)
                          : Text(
                              messagesList.message!,
                              style: textStyleBody2().copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: textColor),
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextView(
                              text: messagesList.messageType.toString() == "2"
                                  ? extension
                                  : "",
                              textStyle: textStyleBody2()
                                  .copyWith(fontSize: font_10)
                                  .copyWith(color: Colors.white)),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextView(
                                    text: convertDateToLocal(
                                        messagesList.createdOn!.toString()),
                                    textAlign: TextAlign.right,
                                    textStyle: textStyleBody2().copyWith(
                                        fontSize: font_10, color: textColor))
                                .marginOnly(bottom: margin_5),
                          ),
                        ],
                      )
                    ],
                  ).marginSymmetric(horizontal: margin_10, vertical: margin_3),
                ),
              )
            ],
          ).marginOnly(top: margin_10, right: margin_70),
        ],
      ),
    );
  }

  rightSideMessageWidget(MessageWindowData messagesList) {
    final extension =
        messagesList.messageFile.toString().split('.').last.toLowerCase();
    return GestureDetector(
      onTap: () async {
        if (messagesList.messageType.toString() == "2") {
          if (messagesList.messageFile.toString().contains("pdf") ||
              messagesList.messageFile.toString().contains("doc") ||
              messagesList.messageFile.toString().contains("docx") ||
              messagesList.messageFile.toString().contains("xls")) {
            _showDocumentBottomSheet(messagesList.messageFile.toString());
          } else {
            _downloadImageBottomSheet(messagesList.messageFile.toString());
          }
        } else {
          Clipboard.setData(ClipboardData(text: messagesList.message!))
              .then((value) {
            print("printed--------------------------");
            showInSnackBar(message: 'Message copied');
          });
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
              decoration: BoxDecoration(
                  color: appGreenColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(radius_10),
                    topRight: Radius.circular(radius_15),
                    bottomLeft: Radius.circular(radius_10),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  messagesList.messageType.toString() == "2"
                      ? ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(radius_10),
                            topRight: Radius.circular(radius_15),
                            bottomLeft: Radius.circular(radius_10),
                          ),
                          child: (messagesList.messageFile
                                      .toString()
                                      .contains("pdf") ||
                                  messagesList.messageFile
                                      .toString()
                                      .contains("doc") ||
                                  messagesList.messageFile
                                      .toString()
                                      .contains("docx") ||
                                  messagesList.messageFile
                                      .toString()
                                      .contains("xls"))
                              ? Container(
                                  height: height_50,
                                  width: Get.width * 0.5,
                                  child: Icon(
                                    Icons.file_copy_rounded,
                                    size: height_50,
                                  ),
                                )
                              : CachedNetworkImage(
                                  imageUrl: messagesList.messageFile
                                      .toString()
                                      .replaceHttp()),
                        ).marginOnly(right: 2, top: 2, left: 2)
                      : Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            messagesList.message ?? "",
                            style: textStyleBody2().copyWith(fontSize: font_14),
                            textAlign: TextAlign.start,
                          ).marginOnly(
                            right: margin_5,
                            left: margin_5,
                            top: margin_3,
                          ),
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                              text: messagesList.messageType.toString() == "2"
                                  ? extension
                                  : "",
                              textStyle:
                                  textStyleBody2().copyWith(fontSize: font_10))
                          .marginOnly(left: margin_10),
                      TextView(
                              text: convertDateToLocal(
                                  messagesList.createdOn!.toString()),
                              textStyle:
                                  textStyleBody2().copyWith(fontSize: font_10))
                          .marginOnly(
                        right: margin_5,
                        left: margin_5,
                        bottom: margin_5,
                      ),
                    ],
                  ),
                  //   TextView(text: messagesList.createdOn!.toString(), textStyle: textStyleBody2().copyWith(fontSize: font_10))
                  //       .marginOnly(right: margin_5, left: margin_5, bottom: margin_5, top: margin_5),
                ],
              )),
        ],
      ).marginOnly(top: margin_8, left: margin_100),
    );
  }

  sendMessageWidget(MessagingController controller) {
    return Stack(
      children: [
        Container(
          color: appBlackColor,
          padding: EdgeInsets.symmetric(vertical: margin_15),
          child: TextField(
            controller: controller.editingController,
            style: TextStyle(color: Colors.white),
            minLines: 1,
            maxLines: 5,
            inputFormatters: [
              // FilteringTextInputFormatter.deny(RegExp("[A-Za-z0-9#+-.]*")),
              FilteringTextInputFormatter.deny(RegExp(regexToRemoveEmoji)),
            ],
            onChanged: (value) {
              controller.messageType = "1";
              controller.update();
            },
            decoration: InputDecoration(
              hintText: strMessage,
              contentPadding: EdgeInsets.symmetric(
                  vertical: margin_1, horizontal: margin_10),
              fillColor: Colors.grey.shade800,
              filled: true,
              hintStyle: textStyleLabel2().copyWith(
                  fontFamily: FontFamily.barnaulGrotesk,
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.w500,
                  fontSize: font_13),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
              border: OutlineInputBorder(borderSide: BorderSide.none),
              suffixIcon: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                      onTap: () {
                        controller.openFilePicker();
                      },
                      child: Icon(
                        Icons.file_copy,
                        size: height_20,
                        color: Colors.white,
                      )).marginOnly(right: margin_10),
                  InkWell(
                    onTap: () {
                      imagePickerDialg();
                    },
                    child: Image(
                      height: height_20,
                      image: AssetImage(
                        iconsAttachment,
                      ),
                    ),
                  ).marginOnly(right: 10),
                  InkWell(
                    onTap: () {
                      print(controller.editingController.text
                          .toString()
                          .isNotEmpty);
                      if (controller.editingController.text
                          .toString()
                          .isNotEmpty) {
                        controller.hitToSendMessage();
                      }
                    },
                    child: Image(
                      height: height_25,
                      image: AssetImage(
                        iconsSend,
                      ),
                    ),
                  ).marginOnly(right: 11),
                ],
              ),
            ),
          ),
        ),
        controller.loadChatResponseModel != null
            ? controller.loadChatResponseModel!.chatStatus == 3
                ? Center(
                    child: Container(
                      width: Get.width,
                      height: height_50,
                      color: appBlackColor,
                      child: TextView(
                        text: strChatEnd,
                        textAlign: TextAlign.center,
                        textStyle:
                            textStyleBody1().copyWith(color: appGreenColor),
                        // textAlign: TextAlign.center,
                      ).marginOnly(top: margin_10),
                    ).marginOnly(top: margin_15),
                  )
                : SizedBox()
            : SizedBox(),
      ],
    );
  }

  openImageView(String url) {
    Get.dialog(
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.cancel,
                  color: Colors.white,
                  size: height_30,
                )),
            Expanded(
              child: Container(
                  width: Get.width,
                  padding: EdgeInsets.all(margin_10),
                  // child: Image.network(url.replaceHttp()),
                  child: CachedNetworkImage(
                    imageUrl: url.replaceHttp(),
                  )),
            ),
          ],
        ),
        barrierColor: appBlackColor);
  }

  messageListView(MessagingController controller) {
    return Container(
      child: controller.messageWindowList.length == 0
          ? Center(
              child: Text(
              "No Conversation Yet!",
              style: TextStyle(color: Colors.white),
            ))
          : GetBuilder(
              init: controller,
              builder: (controller) {
                return ListView.builder(
                  shrinkWrap: true,
                  controller: controller.scrollController,
                  itemCount: controller.messageWindowList.length,
                  reverse: true,
                  itemBuilder: (context, index) {
                    return controller.messageWindowList[index].sender!.id !=
                            controller.loginDataModel!.id
                        ? leftSideMessageWidget(
                            controller.messageWindowList[index])
                        : rightSideMessageWidget(
                            controller.messageWindowList[index]);
                  },
                );
              },
            ),
    );
  }

  imagePickerDialg() {
    Get.bottomSheet(
      ImagePickerDialog(
        galleryFunction: () {
          Get.back();
          controller.updateProfileImageFile(imageFromGallery());
          controller.update();
        },
        cameraFunction: () {
          Get.back();
          controller.updateProfileImageFile(imageFromCamera());
          controller.update();
        },
        title: strImage,
        voidCallback: (data) {
          debugPrint("data");
        },
        recordId: 0,
        action: strImage,
      ),
    );
  }

  Future<void> _downloadImageBottomSheet(String path) {
    return showModalBottomSheet<void>(
        context: Get.overlayContext!,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  decoration: BoxDecoration(
                      // color: Colors.red,
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(radius_20),
                          topRight: Radius.circular(radius_20))),
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Get.back();
                          openImageView(path.replaceHttp());
                        },
                        title: Text("View Image"),
                        trailing: Icon(Icons.remove_red_eye),
                      ),
                      ListTile(
                        onTap: () {
                          controller.saveNetworkImage(path);
                          Get.back();
                        },
                        title: Text("Download Image"),
                        trailing: Icon(Icons.download),
                      ),
                    ],
                  )),
            ],
          );
        });
  }

  Future<void> _showDocumentBottomSheet(String path) {
    print(" path $path");
    String extension = path.split('.').last.toLowerCase();
    return showModalBottomSheet(
        context: Get.overlayContext!,
        builder: (BuildContext context) {
          return Container(
              height: height_90,
              decoration: BoxDecoration(
                  // color: Colors.red,
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(radius_20),
                      topRight: Radius.circular(radius_20))),
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      debugPrint("downloadPath:::$extension");
                      if (extension.contains("pdf") ||
                          extension.contains("doc") ||
                          extension.contains("docx") ||
                          extension.contains("xls")) {
                        controller.openDocument(path.replaceHttp());
                      } else {}
                      Get.back();
                    },
                    title: Text("Download Document"),
                    trailing: Icon(Icons.remove_red_eye),
                  ),
                ],
              ));
        });
  }
}
