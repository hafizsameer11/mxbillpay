/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */


import '../../export.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? appBarTitleText;
  final String? appBarEndText;
  final String? appBarSubtitleText;
  final Widget? leadingWidget;
  final Widget? actionWidget;
  final bool actionIconWidget;
  final Widget? titleWidget;
  final Color? leadingColor;
  final String? backIcon;
  final String? actionIcon;
  final Color? bgColor;
  final Color? centerTitleTextColor;
  final bool? titleInCentre;
  final Function? onTap;
  final Function? onActionTap;
  final bool? doubleTap;
  final double? leadingWidth;
  final bool? isLight;
  final bottomMargin;
  final centerTitleText;
  final topMargin;
  final bool isBack;

  CustomAppBar(
      {Key? key,
      this.appBarTitleText,
      this.appBarEndText,
      this.appBarSubtitleText,
      this.leadingWidget,
      this.leadingColor,
      this.actionWidget,
      this.titleInCentre,
      this.onTap,
      this.doubleTap,
      this.titleWidget,
      this.bgColor,
      this.centerTitleTextColor,
      this.centerTitleText,
      this.leadingWidth,
      this.isLight,
      this.bottomMargin,
      this.topMargin,
      this.backIcon,
      this.actionIcon,
      this.onActionTap,
      this.actionIconWidget = false,
      this.isBack = true})
      : super(key: key);

  bool tapped = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor ?? appBlackColor,
      elevation: 0,
      leading: leadingWidget ??
          GetInkWell(
            onTap: doubleTap != null
                ? () async {
                    if (tapped) {
                      SystemNavigator.pop();
                    } else {
                      tapped = true;
                      Timer(
                        Duration(
                          seconds: 2,
                        ),
                        resetBackTimeout,
                      );

                      showInSnackBar(message: pressToExitApp);

                      return false;
                    }
                  }
                : () {
                    Get.back(result: true);
                  },
            child: isBack == true
                ? AssetImageWidget(
                    backIcon ?? iconsIcBack,
                    imageHeight: height_15,
                  ).marginOnly(left: 20, right: 5)
                : Container(),
          ),
      actions: [
        GetInkWell(
            onTap: onActionTap,
            child: actionIconWidget == true
                ? AssetImageWidget(
                    actionIcon ?? "",
                    imageHeight: height_15,
                  ).marginAll(margin_8)
                : Container()),
        actionWidget ?? Container()
      ],
    );
  }

  void resetBackTimeout() {
    tapped = false;
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
