import '../../../export.dart';

class ProductShimmerView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.white,
      child: Container(
      width: width_150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius_5),
          border: Border.all(
              color: Colors.grey.shade300, width: width_1)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AssetImageWidget(
           iconsPlaceHolder,
            radiusTopLeft: radius_12,
            radiusTopRight: radius_12,
            imageHeight: height_120,
            imageWidth: Get.width,
            radiusAll: 20,
          ).paddingOnly(bottom: margin_10),
          Container(
            height: height_10,
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(radius_10),
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.grey.shade300
                ]
              )
            ),
          ).paddingAll(margin_5),

          Container(
            height: height_10,
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(radius_10),
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.grey.shade300
                ]
              )
            ),
          ).paddingAll(margin_5),


          Container(
            height: height_10,
            width: Get.width*0.15,
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(radius_10),
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.grey.shade300
                ]
              )
            ),
          ).paddingAll(margin_5),

          Container(
            height: height_10,
            decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(radius_10),
                gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.grey.shade300
                    ]
                )
            ),
          ).paddingAll(margin_5),
          Container(
            height: height_10,
            decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(radius_10),
                gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.grey.shade300
                    ]
                )
            ),
          ).paddingAll(margin_5),
          Container(
            height: height_20,
            decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(radius_5),
                gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.grey.shade300
                    ]
                )
            ),
          ).paddingAll(margin_5),



        ],
      ).paddingAll(margin_5),
      ).paddingOnly(left: margin_10),
    );
  }
}
