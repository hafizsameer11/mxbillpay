
import '../../../constants/assets.dart';
import '../../export.dart';

class CustomStoreListTile extends StatelessWidget {
  final trailingIcon;
  final leadingIcon;
  final storeName;
  final leadingHeight;
  final leadingWidth;
  final trailingHeight;
  final trailingWidth;
  final storeLocation;
  final onTap;
  final titleFontStyle;
  final subTitleFontStyle;
  final titleFontColor;
  final subTitleFontColor;
  final columnHorizontalPadding;
  final columnVerticalPadding;
  final trailingPaddingBottom;

  CustomStoreListTile(Key? key,
      {this.leadingIcon,
      this.storeName,
      this.trailingIcon,
      this.leadingHeight,
      this.trailingPaddingBottom,
      this.leadingWidth,
      this.trailingHeight,
      this.trailingWidth,
      this.storeLocation,
      this.onTap,
      this.titleFontStyle,
      this.subTitleFontStyle,
      this.titleFontColor,
      this.subTitleFontColor,
      this.columnVerticalPadding,
      this.columnHorizontalPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AssetImageWidget(
          leadingIcon ?? iconsIcLocation,
          imageHeight: leadingHeight ?? height_15,
          imageWidth: leadingWidth ?? width_15,
        ).paddingAll(margin_5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView(
                text: storeName ?? "",
                textStyle: titleFontStyle ?? textStyleLabel1(),
              ),
              
              TextView(
                text: storeLocation ?? "",
                textStyle: subTitleFontStyle ?? textStyleLabel2(),
              ).paddingOnly(top: margin_3)
            ],
          ).paddingSymmetric(horizontal: columnHorizontalPadding ?? margin_6,vertical: columnVerticalPadding ?? margin_5),
        ),
        InkWell(
            onTap: onTap ?? () {},
            child:
                AssetImageWidget( trailingIcon ?? icon_dropdown,
                imageWidth: trailingWidth ?? width_15,
                imageHeight: trailingHeight ?? height_15,).paddingOnly(bottom: trailingPaddingBottom ?? margin_25,right: margin_20)
        )
      ],
    );
  }
}
