import '../../../export.dart';

class OnBoardingScreen extends StatelessWidget {
  final OnBoardingController controller = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBlackColor,
      body: GetBuilder<OnBoardingController>(
        builder: (controller) {
          return _body();
        },
      ),
    );
  }

  _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Spacer(flex: 2,),
        Center(
          child: AssetImageWidget(imagesOnBoardingScreen,imageHeight: Get.width/1.2),
        ),
        Spacer(flex: 1,),
        TextView(
          text: strBuyAndSellCrypto+" "+strApplicationName,
          textStyle: textStyleLabel1()
              .copyWith(color: Colors.white, fontSize: font_20),
          maxLine: 3,
        ).marginOnly(left: margin_20, right: margin_20,),
        Spacer(),
        GetInkWell(
            onTap: () {
            controller.moveToLoginRoute();
            },
            child: Container(
                height: height_50,
                width: height_50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Get.width),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xA1DFF5DF).withOpacity(0.1),
                          blurRadius: 150,
                          spreadRadius:80,
                      blurStyle: BlurStyle.normal)
                    ]),
                child: Center(child: AssetImageWidget(iconsIcNext)))),
        Spacer(),
      ],
    );
  }
}
