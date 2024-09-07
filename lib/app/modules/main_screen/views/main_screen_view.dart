import '../../../core/widget/user_image_widget.dart';
import '../../../export.dart';

class MainScreenView extends StatelessWidget {
  final controller = Get.put(MainScreenController());
  var ctime;

  @override
  Widget build(BuildContext context) {
    return DoubleBack(
      child: GetBuilder<MainScreenController>(
          init: MainScreenController(),
          builder: (controller) {
            return Scaffold(
              backgroundColor: appBlackColor,
              body: _body(),
              bottomNavigationBar: Container(
                margin: EdgeInsets.only(),
                child: Column(mainAxisSize: MainAxisSize.min, children: [_bottomNav()]),
              ),
            );
          }),
    );
  }

  _body() {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          controller.bottomNavIndex == 3
              ? SizedBox()
              : UserImageWidget(
                  image: controller.loginDataModel.profilePic,
                ).paddingSymmetric(horizontal: 10, vertical: 5),
          Expanded(
            child: controller.homeList[controller.bottomNavIndex].routeName ?? Container(),
          ),
        ],
      ),
    );
  }

  _bottomNav() {
    return Container(
      margin: EdgeInsets.only(left: margin_10, right: margin_10, bottom: margin_10),
      decoration: BoxDecoration(
          color: appGreenColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius_12), topRight: Radius.circular(radius_12), bottomLeft: Radius.circular(radius_12), bottomRight: Radius.circular(radius_12))),
      child: BottomNavigationBar(
        currentIndex: controller.bottomNavIndex,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: Colors.transparent,
        showUnselectedLabels: true,
        onTap: (index) {
          controller.updateBottomNavIndex(index);
        },
        selectedItemColor: appBlackColor,
        unselectedItemColor: textFieldColor,
        selectedLabelStyle: textStyleLabel1().copyWith(color: appBlackColor, fontFamily: FontFamily.barnaulGrotesk),
        unselectedLabelStyle: textStyleBody1().copyWith(color: appBlackColor, fontFamily: FontFamily.barnaulGrotesk),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: icons(imageUrl: controller.bottomNavIndex == 0 ? iconsServiceSelected : iconsService),
            label: strServices,
          ),
          BottomNavigationBarItem(
            icon: icons(imageUrl: controller.bottomNavIndex == 1 ? iconsChat : iconsChat1),
            label: strChat,
          ),
          BottomNavigationBarItem(icon: icons(imageUrl: controller.bottomNavIndex == 2 ? iconsNotification : iconsNotification1), label: strNotification),
          BottomNavigationBarItem(icon: icons(imageUrl: controller.bottomNavIndex == 3 ? iconsProfileb : iconsProfile1), label: strProfile),
          BottomNavigationBarItem(icon: icons(imageUrl: controller.bottomNavIndex == 4 ? iconsSetting : iconsSetting2), label: strSetting),
        ],
      ),
    );
  }
}

Widget icons({imageUrl}) {
  return AssetImageWidget(
    imageUrl ?? "",
    imageHeight: height_20,
  ).marginOnly(bottom: margin_6, top: margin_6);
}
