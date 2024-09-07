import '../../../export.dart';

class EditProfileScreen extends StatelessWidget {
  var controller = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(builder: (controller) {
      return Scaffold(
        appBar: appBar(),
        body: bodyWidget(context),
      );
    });
  }

  appBar() {
    return CustomAppBar(
      appBarTitleText: strProfile,
      titleInCentre: false,
    );
  }

  Widget bodyWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: controller.formGlobalKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Row(
                  children: [
                    CircleAvatar(
                      radius: radius_40,
                      backgroundColor: greenColor,
                      backgroundImage: controller.imagePath.isNotEmpty ? FileImage(File(controller.imagePath.toString())) : null,
                      child: controller.imagePath.isEmpty ? AssetImageWidget(iconsIcImg) : null,
                    ).marginOnly(top: margin_15, bottom: margin_15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width_100,
                          height: height_35,
                          child: MaterialButtonWidget(
                            onPressed: () {
                              chooseImage(context);
                            },
                            buttonText: strChooseFile,
                            padding: margin_7,
                            buttonRadius: radius_9,
                            textColor: greenColor,
                            buttonColor: Colors.white,
                            fontsize: font_13,
                          ),
                        ),
                        TextView(text: strFormatFile, textStyle: textStyleBody2().copyWith(fontSize: font_11, color: greyTextColor)).marginOnly(top: margin_10)
                      ],
                    ).marginOnly(left: margin_50)
                  ],
                )),
            TextFieldWidget(
              contentPadding: EdgeInsets.symmetric(vertical: margin_18, horizontal: margin_10),
              hint: strEnterFirstName,
              textViewText: strFirstName,
              radius: radius_10,
              inputType: TextInputType.text,
              hintStyle: textStyleLabel2().copyWith(
                fontFamily: FontFamily.barnaulGrotesk,
                color: Colors.grey.shade400,
                fontWeight: FontWeight.w500,
              ),
            ).paddingOnly(bottom: margin_10),
            TextFieldWidget(
              contentPadding: EdgeInsets.symmetric(vertical: margin_18, horizontal: margin_10),
              hint: strEnterLastName,
              textViewText: strLastName,
              radius: radius_10,
              inputType: TextInputType.text,
              hintStyle: textStyleLabel2().copyWith(
                fontFamily: FontFamily.barnaulGrotesk,
                color: Colors.grey.shade400,
                fontWeight: FontWeight.w500,
              ),
            ).paddingOnly(bottom: margin_10),
            TextFieldWidget(
              contentPadding: EdgeInsets.symmetric(vertical: margin_18, horizontal: margin_10),
              hint: strEnterPhoneNumber,
              textViewText: strPhoneNumber,
              radius: radius_10,
              maxLength: 15,
              inputType: TextInputType.text,
              hintStyle: textStyleLabel2().copyWith(
                fontFamily: FontFamily.barnaulGrotesk,
                color: Colors.grey.shade400,
                fontWeight: FontWeight.w500,
              ),
            ).paddingOnly(bottom: margin_10),
            TextFieldWidget(
              textController: controller.emailTextController,
              contentPadding: EdgeInsets.symmetric(vertical: margin_18, horizontal: margin_10),
              hint: strEnterEmailAddress,
              textViewText: strEmailAddress,
              radius: radius_10,
              inputType: TextInputType.text,
              hintStyle: textStyleLabel2().copyWith(
                fontFamily: FontFamily.barnaulGrotesk,
                color: Colors.grey.shade400,
                fontWeight: FontWeight.w500,
              ),
            ).paddingOnly(bottom: margin_10),
            MaterialButtonWidget(
              onPressed: () {
                Get.back();
              },
              buttonText: strSaveMyProfile,
              buttonRadius: radius_8,
              buttonColor: greenColor,
            ).marginOnly(top: margin_15),
          ],
        ).marginOnly(left: margin_15, right: margin_15),
      ),
    );
  }

  chooseImage(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(strSelectTheImageSource),
            actions: <Widget>[
              MaterialButton(
                  child: Text(strCamera),
                  onPressed: () {
                    controller.getImageCamera();
                    Get.back();
                  }),
              MaterialButton(
                  child: Text(strGallery),
                  onPressed: () {
                    controller.getImageGallary();
                    Get.back();
                  })
            ],
          );
        });
  }
}
