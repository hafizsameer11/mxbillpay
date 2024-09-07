import '../../export.dart';

class FileImageWidget extends StatelessWidget {
  final File? file;
  final bool isUrlEncoded;
  final double? radiusAll;
  final double radiusTopRight;
  final double radiusTopLeft;
  final double radiusBottomRight;
  final double radiusBottomLeft;
  final double? imageHeight;
  final double? imageWidth;
  final BoxFit imageFitType;
  final Color? color;
  final String? placeHolder;
  final double? padding;

  const FileImageWidget(
      {Key? key,
        required this.file,
        this.radiusAll,
        this.isUrlEncoded = false,
        this.radiusTopLeft = 0.0,
        this.radiusBottomRight = 0.0,
        this.radiusBottomLeft = 0.0,
        this.radiusTopRight = 0.0,
        this.imageHeight,
        this.imageWidth,
        this.color,
        this.padding,
        this.placeHolder,
        this.imageFitType = BoxFit.contain})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: radiusAll == null
            ? BorderRadius.only(
            topRight: Radius.circular(radiusTopRight),
            topLeft: Radius.circular(radiusTopLeft),
            bottomLeft: Radius.circular(radiusBottomLeft),
            bottomRight: Radius.circular(radiusBottomRight))
            : BorderRadius.circular(radiusAll!),
        child: Image.file(
          file!,
          height: imageHeight,
          width: imageWidth,
          fit: imageFitType,
          errorBuilder: (error, stack, obj) {
            debugPrint("error in Image $error");
            return Container(
              alignment: Alignment.center,
              color: Colors.black26,
              child: AssetImageWidget(
                placeHolder ?? iconsPlaceHolder,
                radiusAll: radiusAll,
                imageHeight: imageHeight,
                imageWidth: imageWidth,
              ).paddingAll(padding ?? margin_30),
            );
          },
        ));
  }
}