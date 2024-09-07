import '../../export.dart';

class CustomTitleBar extends StatelessWidget {
  final String? appBarTitleText;
  final String? appBarEndText;
  final Function()? appBarEndClick;
  final String? appBarSubtitleText;
  final Color? titleTextColor;
  final Color? endTextColor;
  const CustomTitleBar({
    super.key,
    this.appBarTitleText,
    this.appBarEndText,
    this.appBarEndClick,
    this.appBarSubtitleText,
    this.titleTextColor,
    this.endTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Visibility(
          visible: appBarTitleText != null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextView(
                  text:
                  appBarTitleText ?? "",
                  maxLine: 2,
                  textAlign: TextAlign.start,
                  textStyle: textStyleBody2().copyWith(
                    color: titleTextColor??textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: font_20,
                  ),
                ),
              ),
              GetInkWell(
                onTap: appBarEndClick,
                child: TextView(text:
                  appBarEndText ?? "",
                  textStyle: textStyleBody2().copyWith(
                    color: endTextColor??textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: font_15,
                  ),
                ).marginOnly(
                  left: margin_20,
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: appBarSubtitleText != null,
          child: TextView(
            text:
            appBarSubtitleText ?? "",
            textStyle: textStyleBody2().copyWith(
              color: textColor,
              fontWeight: FontWeight.w500,
              fontSize: font_20,
            ),
          ),
        ),
      ],
    );
  }
}
