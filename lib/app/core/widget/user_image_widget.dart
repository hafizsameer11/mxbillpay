import '../../export.dart';

class UserImageWidget extends StatelessWidget {
  final String? image;
  const UserImageWidget({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        image!=''?
        NetworkImageWidget(imageUrl: image??"", imageHeight: width_45, imageWidth: width_45,radiusAll: radius_50,):
        AssetImageWidget(iconsImg,imageWidth: width_45,),
       // AssetImageWidget(iconsSuccess,imageWidth: width_18,).marginOnly(left: margin_10),
      ],
    );
  }
}
