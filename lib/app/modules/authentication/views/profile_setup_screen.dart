import 'package:EarlybazeWallet/app/export.dart';
import 'package:EarlybazeWallet/app/modules/authentication/controllers/profile_setup_controller.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../core/widget/file_image_widget.dart';
import '../../../core/widget/image_picker_dialog.dart';
import 'dart:developer' as dev;

class ProfileSetupScreen extends StatelessWidget {
  ProfileSetupScreen({super.key});

  late ProfileSetupController controller;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return DoubleBack(
      isDoubleBackEnable: (Get.arguments != null) ? true : false,
      child: GetBuilder<ProfileSetupController>(
          init: ProfileSetupController(),
          builder: (con) {
            controller = con;
            return Scaffold(
              backgroundColor: appBlackColor,
              appBar: CustomAppBar(
                leadingWidget: (Get.arguments != null) ? SizedBox() : null,
              ),
              body: _bodyWidget(),
            );
          }),
    );
  }

  _bodyWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _profilePicSetup(),
          Form(key: _formKey, child: textFielWidget()),
          selectImage(),
          saveButton(),
          _footer()
        ],
      ),
    );
  }

  Widget _profilePicSetup() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(children: [
            Container(
                    width: height_75,
                    height: height_75,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: controller.profileImage == "" ||
                            controller.profileImage.contains("http")
                        ? NetworkImageWidget(
                            imageUrl: controller.profileImage,
                            imageHeight: height_70,
                            imageWidth: height_70,
                            placeHolder: iconsProfileSetup,
                            radiusAll: height_70,
                            imageFitType: BoxFit.cover,
                          )
                        : FileImageWidget(
                            file: File(controller.profileImage),
                            imageHeight: height_70,
                            imageWidth: height_70,
                            placeHolder: iconsProfileSetup,
                            radiusAll: height_70,
                            imageFitType: BoxFit.cover,
                          ))
                .marginOnly(
              top: margin_10,
            ),
            Positioned(
              bottom: 4,
              right: 4,
              child: InkWell(
                onTap: () {
                  Get.bottomSheet(ImagePickerDialog(
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
                    title: strProfileImage,
                    voidCallback: (data) {
                      debugPrint("data");
                    },
                    recordId: 0,
                    action: strProfileImage,
                  ));
                },
                child: AssetImageWidget(
                  iconsIcCamera,
                  imageWidth: width_20,
                  imageHeight: height_20,
                ),
              ),
            ),
          ]),
          TextView(
            text: strUploadProfile,
            textAlign: TextAlign.center,
            textStyle: textStyleBody3().copyWith(color: Colors.white),
          ).marginSymmetric(horizontal: 10, vertical: margin_10),
        ],
      ),
    );
  }

  selectImage() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (controller.loginDataModel?.idPhoto == null ||
                controller.loginDataModel!.idPhoto.toString().isEmpty)
            ? GetInkWell(
                onTap: () {
                  Get.bottomSheet(ImagePickerDialog(
                    galleryFunction: () {
                      Get.back();
                      controller.updateImageFile(imageFromGallery());
                    },
                    cameraFunction: () {
                      Get.back();
                      controller.updateImageFile(imageFromCamera());
                    },
                    title: strProfileImage,
                    voidCallback: (data) {},
                    recordId: 0,
                    action: strProfileImage,
                  ));
                },
                child: AssetImageWidget(
                  iconsIcUpload,
                  imageWidth: width_60,
                ).paddingOnly(bottom: margin_5),
              )
            : SizedBox.shrink(),

        SizedBox(width: margin_15),
        controller.idImage == '' || controller.idImage.contains("http")
            ? controller.idImage.isNotEmpty
                ? NetworkImageWidget(
                    imageUrl: controller.idImage,
                    imageFitType: BoxFit.fill,
                    radiusAll: radius_10,
                    imageHeight: width_60,
                    imageWidth: width_60,
                  )
                : SizedBox()
            : _selectedImage()

        // _selectedImage()
      ],
    ).marginOnly(left: margin_20, top: margin_9, bottom: margin_10);
  }

  _selectedImage() => Container(
        decoration: BoxDecoration(
          border: Border.all(color: appColor),
          borderRadius: BorderRadius.circular(margin_10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(margin_10),
          child: Image.file(
            File(controller.idImage),
            fit: BoxFit.fill,
            height: width_60,
            width: width_60,
          ),
        ),
      );

  textFielWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldWidget(
          // contentPadding: EdgeInsets.symmetric(
          //     vertical: margin_18, horizontal: margin_10),
          hint: firstName,
          focusNode: controller.firstNameFocusNode,
          textController: controller.firstNameController,
          textViewText: firstName,
          readOnly: controller.firstNameController!.text.isNotEmpty,
          // radius: radius_10,
          inputType: TextInputType.text,
          validate: (data) => Validator.firstName(data),
          hintStyle: textStyleLabel2().copyWith(
            fontFamily: FontFamily.barnaulGrotesk,
            color: Colors.grey.shade400,
            fontWeight: FontWeight.w500,
          ),
        ).paddingOnly(bottom: margin_18),
        TextFieldWidget(
          textController: controller.lastNameController,
          hint: lastName,
          focusNode: controller.lastNameFocusNode,
          textViewText: lastName,
          inputType: TextInputType.text,
          readOnly: controller.lastNameController!.text.isNotEmpty,
          validate: (data) => Validator.lastName(data),
          hintStyle: textStyleLabel2().copyWith(
            fontFamily: FontFamily.barnaulGrotesk,
            color: Colors.grey.shade400,
            fontWeight: FontWeight.w500,
          ),
        ).paddingOnly(bottom: margin_18),
        TextFieldWidget(
          textController: controller.emailController,
          hint: emailAddress,
          textViewText: emailAddress,
          readOnly: controller.emailController!.text.isNotEmpty,
          focusNode: controller.emailFocusNode,
          validate: (data) => Validator.validateEmail(data),
          inputType: TextInputType.text,
          hintStyle: textStyleLabel2().copyWith(
            fontFamily: FontFamily.barnaulGrotesk,
            color: Colors.grey.shade400,
            fontWeight: FontWeight.w500,
          ),
        ).paddingOnly(bottom: margin_18),
        TextView(
                text: strPhoneNumber,
                textStyle: textStyleBody3().copyWith(color: appGreenColor))
            .marginOnly(left: margin_9, bottom: margin_5),
        _phoneTextField(),
        TextFieldWidget(
          textController: controller.dobTextController,
          hint: strDateOfBirth,
          textViewText: strDateOfBirth,
          inputType: TextInputType.text,
          readOnly: true,
          hintStyle: textStyleLabel2().copyWith(
            fontFamily: FontFamily.barnaulGrotesk,
            color: Colors.grey.shade400,
            fontWeight: FontWeight.w500,
          ),
          suffixIcon:
              (controller.loginDataModel?.dob.toString().isEmpty ?? false)
                  ? GetInkWell(
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            builder: (BuildContext context, Widget? child) {
                              return Theme(
                                data: ThemeData(
                                  primarySwatch: Colors.grey,
                                  splashColor: Colors.black,
                                  textTheme: TextTheme(
                                    titleMedium: TextStyle(color: Colors.black),
                                    labelLarge: TextStyle(color: Colors.black),
                                  ),
                                  colorScheme: ColorScheme.light(
                                      primary: appGreenColor,
                                      onSecondary: Colors.black,
                                      onPrimary: Colors.white,
                                      surface: textColor,
                                      onSurface: Colors.black,
                                      secondary: Colors.black),
                                  dialogBackgroundColor: Colors.white,
                                ),
                                child: child ?? Text(""),
                              );
                            },
                            context: Get.overlayContext!,
                            initialDate: DateTime(2003),
                            firstDate: DateTime(1950),
                            lastDate: DateTime(2003));

                        if (pickedDate != null) {
                          print(pickedDate);
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(formattedDate);

                          controller.dobTextController?.text = formattedDate;
                        } else {}
                      },
                      child: AssetImageWidget(
                        iconsCalender,
                        imageHeight: height_15,
                      ).marginAll(margin_10))
                  : null,
        ).paddingOnly(bottom: margin_18),
        TextFieldWidget(
          textController: controller.countyController,
          hint: strCountry,
          textViewText: strCountry,
          focusNode: controller.countryFocusNode,
          inputType: TextInputType.text,
          readOnly: (controller.loginDataModel?.country != null),
          hintStyle: textStyleLabel2().copyWith(
            fontFamily: FontFamily.barnaulGrotesk,
            color: Colors.grey.shade400,
            fontWeight: FontWeight.w500,
          ),
        ).paddingOnly(bottom: margin_18),
        TextFieldWidget(
          textController: controller.stateController,
          hint: strState,
          textViewText: strState,
          readOnly: (controller.loginDataModel?.state != null),
          focusNode: controller.stateFocusNode,
          inputType: TextInputType.text,
          hintStyle: textStyleLabel2().copyWith(
            fontFamily: FontFamily.barnaulGrotesk,
            color: Colors.grey.shade400,
            fontWeight: FontWeight.w500,
          ),
        ).paddingOnly(bottom: margin_18),
        TextFieldWidget(
          textController: controller.cityController,
          hint: strCity,
          readOnly: (controller.loginDataModel?.city != null),
          textViewText: strCity,
          focusNode: controller.cityFocusNode,
          inputType: TextInputType.text,
          hintStyle: textStyleLabel2().copyWith(
            fontFamily: FontFamily.barnaulGrotesk,
            color: Colors.grey.shade400,
            fontWeight: FontWeight.w500,
          ),
        ).paddingOnly(bottom: margin_18),
        TextView(
                text: strIDProof,
                maxLine: 2,
                textAlign: TextAlign.start,
                textStyle: textStyleBody3().copyWith(color: appGreenColor))
            .marginOnly(bottom: margin_5)
      ],
    ).marginOnly(left: margin_20, right: margin_20);
  }

  _phoneTextField() {
    return IntlPhoneField(
      showCountryFlag: true,
      showDropdownIcon: true,
      disableLengthCheck: true,
      enabled: !(controller.loginDataModel?.mobileNo!.isNotEmpty ?? false),
      dropdownIconPosition: IconPosition.trailing,
      flagsButtonPadding: EdgeInsets.only(left: margin_10),
      keyboardType: TextInputType.number,
      initialCountryCode: controller.selectedCountry?.value.code,
      invalidNumberMessage: keyInvalidMobileNumber.tr,
      focusNode: controller.phoneNUmberFocusNode,
      dropdownTextStyle:
          textStyleHeading3().copyWith(color: textColor, fontSize: font_15),
      controller: controller.phoneNumberController,
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(r'^0+')),
        LengthLimitingTextInputFormatter(
            controller.selectedCountry?.value.maxLength)
      ],
      cursorColor: appColor,
      style: textStyleHeading3().copyWith(color: textColor, fontSize: font_15),
      decoration: InputDecoration(
        errorMaxLines: 1,
        isDense: true,
        hoverColor: Colors.red,
        filled: true,
        contentPadding:
            EdgeInsets.symmetric(horizontal: margin_20, vertical: margin_15),
        hintText: strEnterPhoneNumber.tr,
        counterText: "",
        hintStyle: textStyleLabel2().copyWith(
          fontFamily: FontFamily.barnaulGrotesk,
          color: Colors.grey.shade400,
          fontWeight: FontWeight.w500,
          fontSize: font_13,
        ),
        fillColor: textFieldColor,
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(margin_7),
            borderSide: BorderSide(color: textFieldBorderColor)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(margin_7),
            borderSide: BorderSide(color: textFieldBorderColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(margin_7),
            borderSide: BorderSide(color: textFieldBorderColor)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(margin_7),
            borderSide: BorderSide(color: textFieldBorderColor)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(margin_7),
            borderSide: BorderSide(color: textFieldBorderColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(margin_7),
            borderSide: BorderSide(color: textFieldBorderColor)),
      ),
      onChanged: (phone) {
        print(phone.completeNumber);
      },
      onCountryChanged: (country) {
        controller.selectedCountry?.value = country;
        controller.phoneNumberController?.clear();
        controller.update();
      },
    ).paddingOnly(bottom: margin_15);
  }

  saveButton() {
    return GradientButton(
      buttonText: strSave,
      raduis: radius_30,
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          print(controller.profileImage);
          if (controller.phoneNumberController!.text.isEmpty) {
            controller.phoneNUmberFocusNode.requestFocus();
            showInSnackBar(message: strPhoneNumber + " " + strValidationEmpty);
          } else if (controller.profileImage == "") {
            showInSnackBar(message: strUploadProfileImages);
          } else {
            controller.updateProfileAPI();
          }
        }
      },
    ).marginSymmetric(horizontal: margin_20, vertical: margin_20);
  }

  Widget _dateNewHistory() => TextFieldWidget(
        isOutined: true,

        textController: controller.dobTextController,
        inputAction: TextInputAction.done,
        inputType: TextInputType.text,
        suffixIcon: AssetImageWidget(
          iconsCalender,
          imageHeight: height_15,
        ).marginAll(margin_10),
        readOnly: true,
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
              context: Get.context!,
              initialDate: DateTime.now(),
              firstDate: DateTime(1950),
              //DateTime.now() - not to allow to choose before today.
              lastDate: DateTime(2100));

          if (pickedDate != null) {
            print(
                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
            print(
                formattedDate); //formatted date output using intl package =>  2021-03-16
            controller.dobTextController!.text = formattedDate;
          } else {}
        },
        // validate: (data) =>
        //     Validator.fieldChecker(value: data, message: "strDateNew"),
        tvHeading: "strDateNew",
      ).marginOnly(top: height_20);

  _footer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextView(
            text: strFooter,
            textStyle:
                TextStyle(color: appGreenColor, fontWeight: FontWeight.w300)),
      ],
    );
  }
}
