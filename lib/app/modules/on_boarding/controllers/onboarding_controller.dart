

import '../../../../constants/assets.dart';
import '../../../export.dart';

class OnBoardingController extends GetxController {
  int currentIndex = 0;
  late PageController pageController;

  List<ItemDataModel> onBoardingData= [
    ItemDataModel(
        image: iconOnBoarding1,
        title: onBoardingTitleOne,
        subtitle: onBoardingSubTitleOne),
    ItemDataModel(
        image: iconOnBoarding2,
        title: onBoardingTitleTwo,
        subtitle: onBoardingSubTitleTwo),
    ItemDataModel(
        image: iconOnBoarding3,
        title: onBoardingTitleThree,
        subtitle: onBoardingSubTitleThree)
  ];

  moveToLoginRoute() {
    Get.find<PreferenceManger>().firstLaunch(true);
    Get.offAllNamed(AppRoutes.loginScreen);
  }

  onSlide(index) {
    currentIndex = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
