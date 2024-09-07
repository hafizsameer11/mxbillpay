import 'package:EarlybazeWallet/app/export.dart';

class SettingWidget extends StatelessWidget {
  final String? titleImage;
  final String? toggleImage;
  final String? title;
  final bool? toggle;
  final bool? isToggle;
  final Function? onTap;
  final ValueChanged? onChanged;

  const SettingWidget({super.key, this.title, this.titleImage, this.onTap, this.toggleImage, this.toggle = false, this.isToggle = false, this.onChanged});

  @override
  Widget build(BuildContext context) {


    return GetInkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              AssetImageWidget(
                titleImage ?? "",
                imageHeight: height_40,
              ),
              TextView(text: title ?? '', textStyle: textStyleBody2().copyWith(color: textColor, fontSize: font_17)).marginOnly(left: margin_10)
            ],
          ),
          toggle == true
              ? Transform.scale(
                  scale: 0.7,
                  child: CupertinoSwitch(
                    value: isToggle ?? false,
                    activeColor: appGreenColor,
                    trackColor: CupertinoColors.inactiveGray,
                    thumbColor: Colors.black,
                    onChanged: onChanged,
                  ),
                )
              : SizedBox(),
        ],
      ).marginOnly(top: margin_10),
    );
  }
}
