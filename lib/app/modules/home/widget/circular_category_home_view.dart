


import '../../../export.dart';

class CircularCategoryHomeView extends StatelessWidget{
  final productImage;
  final productName;


  CircularCategoryHomeView(Key? key,
  {this.productImage,
  this.productName});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: (){
            Get.toNamed(AppRoutes.productDetailScreen);
          },
          child: Container(
            height: height_60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade200,
                border:
                    Border.all(color: Colors.grey.shade300, width: width_1)),
            child: imageAsset(productImage ?? "", fit: BoxFit.contain),
          ).paddingOnly(left: margin_10),
        ),
        TextView(
                text: productName,
                textStyle: textStyleSubTitle().copyWith(
                    fontFamily: FontFamily.barnaulGrotesk,
                    fontSize: font_14,
                    fontWeight: FontWeight.w600))
            .paddingOnly(left: margin_5, top: margin_8)
      ],
    ).paddingOnly(left: margin_5);

  }

}