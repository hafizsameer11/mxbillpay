import 'package:EarlybazeWallet/app/export.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../../core/widget/custom_title_bar.dart';
import '../controller/notification_controller.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({
    super.key,
    this.isRead,
  });

  final bool? isRead;

  late NotificationController controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
        init: NotificationController(),
        builder: (con) {
          controller = con;
          return Scaffold(
            backgroundColor: appBlackColor,
            body: _bodyWidget() ??
                Text(
                  "data",
                  style: TextStyle(color: Colors.white),
                ),
          );
        });
  }

  _bodyWidget() {
    return Column(
      children: [
        userProfileWidget(),
        SizedBox(
          height: margin_15,
        ),
        notificationWidget()
      ],
    );
  }

//{notification_type: 1, service_id: a6e2c11b-afaa-4680-b3e8-1643780c06c0, reciver_id: cc0934ab-f405-4a1a-bcb4-7ae853be0fa9, description: New chat assigned regarding Wallet Service, notification_id: 211b9d11-a596-409c-bf68-c1b38f7f54d1, title: New Chat Assigned, object_id: 6349ba0c-aced-45f8-8158-21908a050607}
  notificationWidget() {
    return Expanded(
        child: controller.notificationList.length == 0
            ? Container(
                child: Center(
                  child: Text(
                    'No Notification Added',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: controller.notificationList.length,
                itemBuilder: (BuildContext context, int index) {
                  controller.index = index;
                  return GestureDetector(
                    onTap: () {
                      Get.dialog(dialogBoxWidget(index));
                      controller.isReadNotificationApiCall(controller.notificationList[index].id);
                    },
                    child: Container(
                        //  padding: EdgeInsets.all(margin_10),
                        margin: EdgeInsets.only(bottom: margin_15, left: margin_10, right: margin_10),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFF04C304), Color(0xFFD2FAC0)],
                              begin: const Alignment(0.6, -1),
                              end: const Alignment(0.6, 0.95),
                            ),
                            borderRadius: BorderRadius.circular(radius_15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Image(
                                height: height_38,
                                image: AssetImage(
                                  iconsNotiify,
                                ),
                              ),
                            ).marginOnly(right: margin_15, left: margin_17),
                            Expanded(
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                TextView(
                                    maxLine: 1,
                                    text: controller.notificationList[index].title ?? "",
                                    textStyle: textStyleBody1().copyWith(color: appBlackColor, fontSize: font_14, fontWeight: FontWeight.w600)),
                                Html(data: controller.notificationList[index].description ?? 'Info will be available soon.', style: {
                                  'p': Style(
                                      fontSize: FontSize(font_13),
                                      color: Colors.black,
                                      fontFamily: "PublicSans",
                                      fontWeight: FontWeight.w400,
                                      maxLines: 1,
                                      textOverflow: TextOverflow.ellipsis),
                                  '#': Style(
                                      fontSize: FontSize(font_13),
                                      color: Colors.black,
                                      fontFamily: "PublicSans",
                                      fontWeight: FontWeight.w400,
                                      maxLines: 1,
                                      textOverflow: TextOverflow.ellipsis),
                                }).marginOnly(right: 20),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextView(
                                              text: convertDateToLocal(controller.notificationList[index].createdOn),
                                              textStyle: textStyleBody2().copyWith(fontSize: font_10, color: Colors.black, fontWeight: FontWeight.bold))
                                          .marginOnly(right: 8),
                                      Icon(Icons.done_all, size: 18, color: controller.notificationList[index].isRead == true ? Colors.blue : Colors.white).marginOnly(right: 5),
                                    ],
                                  ).paddingOnly(bottom: 5),
                                )
                              ]).marginOnly(top: margin_6),
                            ),
                          ],
                        )),
                  );
                }));
  }

  userProfileWidget() {
    return CustomTitleBar(
      appBarTitleText: strRecent,
      titleTextColor: Colors.white,
      appBarEndText: controller.notificationList.isEmpty ? "" : strClearAll,
      appBarEndClick: () {
        controller.clearAllNotificationApi();
      },
      endTextColor: appGreenColor,
    ).marginSymmetric(vertical: 20, horizontal: 10);
  }

  dialogBoxWidget(int index) {
    return Dialog(
        shadowColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: Colors.black87,
        child: Stack(children: <Widget>[
          ListView(
            shrinkWrap: true,
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              TextView(
                      text: controller.notificationList[index].title ?? "",
                      textAlign: TextAlign.start,
                      textStyle: textStyleHeading2().copyWith(color: textColor, fontSize: font_18))
                  .marginOnly(left: 8, bottom: 10),
              (controller.notificationList[index].description!.contains("<p>"))
                  ? Html(data: controller.notificationList[index].description ?? '', style: {
                      'p': Style(
                        fontSize: FontSize(font_13),
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        // fontFamily: "PublicSans",
                        textAlign: TextAlign.start,

                        //textOverflow: TextOverflow.ellipsis
                      ),
                    })
                  : Text(
                      "${controller.notificationList[index].description.toString()}",
                      style: textStyleBody2().copyWith(color: Colors.white),
                      textAlign: TextAlign.start,
                    ).paddingAll(
                      margin_10,
                    ),
              controller.notificationList[index].announcement?.image == null || controller.notificationList[index].announcement?.image == ''
                  ? SizedBox()
                  : TextView(text: strDialogImage, textAlign: TextAlign.start, textStyle: textStyleBody1().copyWith(color: textColor, fontSize: font_15))
                      .marginOnly(bottom: margin_10, left: 8),
              Row(
                children: [
                  controller.notificationList[index].announcement?.image == null || controller.notificationList[index].announcement?.image == '' ? SizedBox() : ImageWidget(index)
                ],
              )
            ],
          ).marginOnly(left: 30, right: 30, top: 40, bottom: 20),
          Positioned(
              right: 15,
              top: 15,
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  child: Image(
                    height: height_25,
                    image: AssetImage(
                      iconsCancel,
                    ),
                  ),
                ),
              )),
        ]));
  }

  ImageWidget(int index) {
    return FancyShimmerImage(
      height: height_50,
      width: width_50,
      imageUrl: controller.notificationList[index].announcement?.image ?? '',
      errorWidget: AssetImageWidget(
        iconsPlaceHolder ?? iconsPlaceHolder,
        radiusAll: radius_10,
        imageHeight: height_50,
        imageWidth: width_50,
        imageFitType: BoxFit.fill,
      ),
    ).marginAll(5).marginOnly(left: 8);
  }


}


