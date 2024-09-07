import '../../../export.dart';

class AdViewWidget extends StatelessWidget {
  final String? assetImageURL;

  const AdViewWidget({
    Key? key,
    this.assetImageURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: margin_3),
        decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(radius_15)),
        child: _bodyWidget());
  }

  Widget _bodyWidget() => AssetImageWidget(
   assetImageURL ?? "",
    imageHeight: height_120,
    imageWidth: Get.width,
    radiusAll: radius_20,
    imageFitType: BoxFit.cover,
  );
}