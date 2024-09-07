




import '../../../export.dart';

class SplashViewScreen extends StatelessWidget {
  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBlackColor,
      body: _body(),
    );
  }

  _body() {
    return Container(
      decoration: BoxDecoration(
        image:DecorationImage(image: AssetImage(iconsIcSplash),fit: BoxFit.cover)
      ),
      child: Center(
        child: AssetImageWidget(iconsLogo,imageHeight:height_160),
      ),
    );
  }
}
