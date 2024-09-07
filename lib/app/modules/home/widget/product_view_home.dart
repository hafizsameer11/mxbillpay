

import '../../../export.dart';

class ProductViewHome extends StatelessWidget {

  final productName;
  final productDescription;
  final productPrice;
  final productImage;
  final productSubtitle;


  const ProductViewHome(
      Key? key,
      {this.productName,
        this.productDescription,
        this.productPrice,
        this.productImage,
        this.productSubtitle}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      width: width_120,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Stack(
            children: [
              AssetImageWidget(
              productImage ?? "",
              radiusTopLeft: radius_12,
              radiusTopRight: radius_12,
              imageHeight: height_100,
              imageWidth: Get.width,
            ).paddingOnly(bottom: margin_10,top: margin_5),
              InkWell(
                onTap: (){
                  Get.toNamed(AppRoutes.productDetailScreen);
                },
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(radius_5),
                        color: buttonColor
                      ),
                      child: Icon(Icons.add,color: Colors.white,)),
                ),
              )
            ],
          ),

          SizedBox(
              height: height_28,
              child: InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.productDetailScreen);
                },
                child: TextView(
                    text: productDescription ?? "",
                    textAlign: TextAlign.start,
                    maxLine: 1,
                    textStyle: textStyleSubTitle().copyWith(
                        color: Colors.black,
                        fontFamily: FontFamily.barnaulGrotesk,
                        fontSize: font_14)),
              )),

          SizedBox(
            height: height_25,
            child: TextView(
              text : productPrice ?? "",
              textStyle: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w400,
                  fontSize: font_18),
              maxLine: 1,
            )
          ).paddingOnly(top: margin_5,bottom: margin_2),

          SizedBox(
              height: height_20,
              child: InkWell(
                onTap: (){
                  Get.toNamed(AppRoutes.productDetailScreen);
                },
                child: TextView(
                  text :productName ?? "JuiceName",
                  textStyle: TextStyle(
                      fontSize: font_13,
                      fontFamily: FontFamily.barnaulGrotesk,
                      color: Colors.grey.shade400),
                  maxLine: 1,
                ),
              )
          ),

          SizedBox(
              height: height_20,
              child: InkWell(
                onTap: (){
                  Get.toNamed(AppRoutes.productDetailScreen);
                },
                child: TextView(
                  text :productSubtitle ?? "description Two",
                  textStyle: TextStyle(
                      fontSize: font_13,
                      fontFamily: FontFamily.barnaulGrotesk,
                      color: Colors.grey.shade400),
                  maxLine: 1,
                ),
              )
          ),


        ],
      ).paddingAll(margin_5),
    ).paddingOnly(left: margin_15);
  }
}
