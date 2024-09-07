import 'package:EarlybazeWallet/app/export.dart';
import 'package:EarlybazeWallet/app/modules/setting/controller/faq_controller.dart';
import 'package:simple_html_css/simple_html_css.dart';

import '../../../core/widget/custom_title_bar.dart';

class FaqScreen extends StatelessWidget {
  FaqScreen({super.key});

  late FaqController controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FaqController>(
        init: FaqController(),
        builder: (_con) {
          controller = _con;
          return Scaffold(
            backgroundColor: appBlackColor,
            appBar: CustomAppBar(),
            body: _bodyWidget(),
          );
        });
  }

  Widget _bodyWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitleBar(
          appBarTitleText: strFaq,
        ),
        _faqView(),
      ],
    ).marginAll(17);
  }

  Widget _faqView() {
    return  controller.faqList.length == 0 ? _NoFaq() :  Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.faqList.length,
          itemBuilder: (BuildContext context, int i) {
            return GestureDetector(
              onTap: () {
                controller.activeMeterIndex = controller.activeMeterIndex == i ? null : i;
                controller.update();
              },
              child: Container(
                margin: EdgeInsets.only(bottom: margin_15),
                decoration: BoxDecoration(
                    //color: appBlackColor,
                    borderRadius: BorderRadius.circular(radius_12)),
                child: Card(
                  color: appBlackColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius_50),
                  ),
                  elevation: 0.2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(radius_10),
                    child: new ExpansionPanelList(
                      expandedHeaderPadding: EdgeInsets.only(bottom: margin_0, top: margin_0),
                      expandIconColor: controller.activeMeterIndex == i ? appGreenColor : textColor,
                      expansionCallback: (int index, bool status) {
                        controller.activeMeterIndex = controller.activeMeterIndex == i ? null : i;
                        controller.update();
                      },
                      children: [
                        new ExpansionPanel(
                          backgroundColor: textFieldColor,
                          isExpanded: controller.activeMeterIndex == i,
                          headerBuilder: (BuildContext context, bool isExpanded) => TextView(
                              text: 'Q: ${controller.faqList[i].question}' ?? "",
                              textAlign: TextAlign.start,
                              textStyle: textStyleBody2().copyWith(
                                color: controller.activeMeterIndex == i ? appGreenColor : textColor,
                                fontWeight: FontWeight.w500,
                                fontSize: font_16,
                              )).marginAll(margin_15),
                          body: Align(
                            alignment: Alignment.centerLeft,
                            child: RichText(
                                text: HTML.toTextSpan(
                              context,
                              controller.faqList[i].answer ?? "",
                              defaultTextStyle: textStyleBody1().copyWith(
                                color: textColor,
                                fontWeight: FontWeight.w400,
                              ),
                              overrideStyle: {"body": TextStyle(color: appBlackColor, fontSize: font_18, fontFamily: "Roboto")},
                            )),
                          ).marginOnly(bottom: margin_15, left: margin_15, right: margin_15),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }).marginOnly(top: 15),
    );
  }

  _NoFaq() {
    return SizedBox(
      height: Get.height * 0.7,
      child: Center(
        child:
            TextView(text: "FAQ's not found", textStyle: textStyleBody1().copyWith(color: textColor)),
      ),
    );
  }
}
