import 'package:EarlybazeWallet/app/modules/Gallery/Controller/WaitingMessageController.dart';
import 'package:lottie/lottie.dart';
import '../../core/widget/custom_title_bar.dart';
import '../../export.dart';

class WaitingMessage extends StatelessWidget {
  const WaitingMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.put(WaitingMessageController()),
      builder: (controller) => Scaffold(
        appBar: CustomAppBar(
          onTap: () {
            Get.back();
          },
        ),
        backgroundColor: appBlackColor,
        body: _bodyWidget(controller),
      ),
    );
  }

  _bodyWidget(WaitingMessageController controller) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: CustomTitleBar(
            appBarTitleText: controller.argumentModel?.title.toString(),
          ).marginOnly(top: margin_15),
        ).paddingSymmetric(horizontal: margin_15),
        Align(
          alignment: Alignment.center,
          child: controller.isSearching ? _searchingScreen() : _waitingScreen(),
        ),
      ],
    );
  }

  _waitingScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: height_15,
        ),
        AssetImageWidget(iconsTimeLeft, imageHeight: height_60),
        SizedBox(
          height: height_15,
        ),
        TextView(text: strWaitingMessage, maxLine: 3, textStyle: textStyleBody1().copyWith(color: textColor, fontSize: font_13, fontWeight: FontWeight.w500))
      ],
    );
  }

  _searchingScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: height_15,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: margin_50),
          child: Lottie.asset(
            searchingJson,
          ),
        ),
        SizedBox(
          height: height_15,
        ),
        TextView(text: strFindingAgent, maxLine: 3, textStyle: textStyleBody1().copyWith(color: textColor, fontSize: font_13, fontWeight: FontWeight.w500))
      ],
    );
  }
}
