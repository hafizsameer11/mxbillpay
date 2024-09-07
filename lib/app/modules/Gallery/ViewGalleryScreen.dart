import 'package:EarlybazeWallet/app/modules/chat/view/MessagingScreen.dart';

import '../../export.dart';
import 'Controller/view_gallery_controller.dart';

class ViewGalleryScreen extends StatelessWidget {
  ViewGalleryScreen({super.key});

  late ViewGalleryScreenController controller;
  List<String> imageList = [
    icon1,
    icon2,
    icon3,
    icon4,
    icon5,
    icon6,
    icon7,
    icon8,
    icon9
  ];
  String path = '';
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewGalleryScreenController>(
        init: ViewGalleryScreenController(),
        builder: (_controller) {
          controller = _controller;
          return Scaffold(
            backgroundColor: transparentBlackColor,
            appBar: CustomAppBar(
              onTap: () {
                Get.back();
              },
            ),
            body: SizedBox(
              width: Get.width,
              child: controller.receiver != null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: margin_30,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(height_100),
                          child: NetworkImageWidget(
                            imageUrl: controller.receiver!.profilePic ?? '',
                            placeHolder: iconsImg,
                            imageHeight: height_90,
                            imageWidth: height_90,
                            imageFitType: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: margin_10,
                        ),
                        TextView(
                                text: controller.receiver!.fullName ?? "",
                                textStyle: textStyleBody2().copyWith(
                                    color: textColor,
                                    fontSize: font_15,
                                    fontWeight: FontWeight.bold))
                            .marginOnly(bottom: margin_5),
                        TextView(
                            text: strViewGallery
                                .replaceAll("View", "")
                                .removeAllWhitespace,
                            textStyle: textStyleBody2().copyWith(
                                fontSize: font_11, color: appGreenColor)),
                        SizedBox(
                          height: margin_30,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(margin_20),
                            child: controller.imageList.isNotEmpty
                                ? GridView.count(
                                    shrinkWrap: true,
                                    crossAxisCount: 3,
                                    crossAxisSpacing: margin_10,
                                    mainAxisSpacing: margin_10,
                                    children: List.generate(
                                        controller.imageList.length,
                                        (index) => GestureDetector(
                                              onTap: () {
                                                Get.put(MessagingScreen())
                                                    .openImageView(controller
                                                            .imageList[index]
                                                            .image ??
                                                        "");
                                              },
                                              child: NetworkImageWidget(
                                                imageUrl: controller
                                                        .imageList[index]
                                                        .image ??
                                                    "",
                                                imageHeight: height_100,
                                                imageWidth: height_100,
                                                imageFitType: BoxFit.cover,
                                              ),
                                            )))
                                : Center(
                                    child: Text(
                                    "No Image Found",
                                    style: TextStyle(color: Colors.white),
                                  )),
                          ),
                        ),
                      ],
                    )
                  : SizedBox(),
            ),
          );
        });
  }
}
