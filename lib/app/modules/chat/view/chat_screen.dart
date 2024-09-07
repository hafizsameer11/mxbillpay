import 'package:EarlybazeWallet/app/export.dart';

import '../../../core/widget/custom_title_bar.dart';
import '../controller/chat_controller.dart';

class ChatScreen extends StatelessWidget {
  final Function? onTap;

  late ChatController controller;

  ChatScreen({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
        init: ChatController(),
        builder: (con) {
          controller = con;
          return Scaffold(
            backgroundColor: appBlackColor,
            body: _bodyWidget(),
          );
        });
  }

  _bodyWidget() {
    return Column(
      children: [
        CustomTitleBar(
          appBarTitleText: strChat,
        ).marginOnly(top: margin_15, bottom: margin_15),
        Expanded(child: _userChatList()),
      ],
    ).marginSymmetric(horizontal: 10);
  }

  _userChatList() {
    return controller.userList.isEmpty
        ? Center(
            child: Text(
              "You have no any chat yet.",
              style: TextStyle(color: Colors.white70),
            ),
          )
        : ListView.builder(
            shrinkWrap: true,
            controller: controller.scrollController,
            itemCount: controller.userList.length,
            itemBuilder: (context, index) {
              return listViewItemWidget(index);
            },
          );
  }

  listViewItemWidget(int index) {
    return InkWell(
      onTap: () async {
        var result = await Get.toNamed(AppRoutes.MessagingScreen, arguments: {
          "isFromChat": true,
          "receiverDetails": controller.userList[index]
        });
        if (result != null) {
          controller.chatApiCall();
        }
      },
      child: Row(
        children: [
          NetworkImageWidget(
              imageUrl: controller.userList[index].receiver?.profilePic ?? '',
              imageHeight: height_55,
              radiusAll: radius_60,
              placeHolder: iconsLogo,
              imageWidth: width_60),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                        text: controller.userList[index].receiver?.fullName ??
                            '',
                        textStyle: textStyleBody2().copyWith(
                            color: textColor,
                            fontSize: font_15,
                            fontWeight: FontWeight.bold))
                    .marginOnly(bottom: margin_5),
                TextView(
                    text:
                        controller.userList[index].lastMessage!.messageType == 2
                            ? ""
                            : controller.userList[index].lastMessage!.message ??
                                "Chat not started yet.",
                    textStyle: textStyleBody2().copyWith(
                      color: textWhiteColor,
                      fontSize: font_12,
                    )),
              ],
            ).marginOnly(left: 20),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextView(
                      text: convertDateToLocal(
                          controller.userList[index].lastMessage!.createdOn ??
                              ''),
                      textStyle: textStyleBody2()
                          .copyWith(color: appGreenColor, fontSize: 12))
                  .marginOnly(bottom: 3),
              controller.userList[index].service?.title != 'Admin Service'
                  ? Container(
                      padding: EdgeInsets.symmetric(
                          vertical: margin_2, horizontal: margin_5),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade800,
                          borderRadius: BorderRadius.circular(3)),
                      child: TextView(
                          text: controller.userList[index].service?.title ?? "",
                          textStyle: textStyleBody2()
                              .copyWith(color: textColor, fontSize: 13)),
                    )
                  : SizedBox()
            ],
          ).marginOnly(left: 60)
        ],
      ).marginOnly(top: margin_20),
    );
  }
}
