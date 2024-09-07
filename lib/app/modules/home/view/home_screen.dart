
import '../../../export.dart';
import '../../Gallery/WaitingMessageScreen.dart';
import '../widget/grid_view_home.dart';

class HomeScreenPage extends StatelessWidget {
  final HomeScreenController controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      init: HomeScreenController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: appBlackColor,
          body: _body(),
        );
      },
    );
  }

  _body() {
    return ListView(
      shrinkWrap: true,
      children: [
        SizedBox(
          height: 10,
        ),
        _text(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 10, childAspectRatio: 0.70),
            itemCount: controller.serviceDataModel.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.to(WaitingMessage(), arguments: (controller.serviceDataModel[index]));
                },
                child: HomeGrid(
                    title: " ${controller.serviceDataModel[index].title ?? ""} ",
                    subtitle1: "Response Time:",
                    imageFile: controller.serviceDataModel[index].image,
                    subtitle2: "${controller.serviceDataModel[index].minTime ?? ""}-${controller.serviceDataModel[index].maxTime ?? ""} Minutes Max",
                    supportType: controller.serviceDataModel[index].supportType!.title),
              );
            },
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    ).marginOnly(left: margin_10, right: margin_10);
  }

  _text() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
            text: "Hi, ${controller.loginDataModel.firstName ?? ""} ${controller.loginDataModel.lastName ?? ""}",
            textStyle: textStyleTitle1().copyWith(fontWeight: FontWeight.bold, color: Color(0xFF04C304), fontSize: 20)),
        Padding(
          padding: EdgeInsets.only(right: margin_8, top: margin_8),
          child: TextView(
              text: StrDes1 + " " + StrDes, maxLine: 2, textAlign: TextAlign.start, textStyle: textStyleBody2().copyWith(fontWeight: FontWeight.w500, color: Colors.white)),
        ),
      ],
    ).marginOnly(
      bottom: 20,
    );
  }
}
