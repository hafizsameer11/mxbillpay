import 'package:EarlybazeWallet/app/export.dart';
import 'package:EarlybazeWallet/app/modules/authentication/controllers/static_page_controller.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../core/widget/custom_title_bar.dart';

class StaticPage extends StatelessWidget {
  StaticPage({super.key});
  late StaticPageController controller;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StaticPageController>(
        init: StaticPageController(),
        builder: (_con) {
          controller = _con;
          return Scaffold(
            backgroundColor: appBlackColor,
            appBar: CustomAppBar(),
            body: _bodyWidget(),
          );
        });
  }

  _bodyWidget() => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [_htmlWidget()],
        ).paddingSymmetric(horizontal: margin_15, vertical: margin_15),
      );
  _htmlWidget() => Column(
        children: [
          CustomTitleBar(
              appBarTitleText: controller.isType == 1
                  ? strTermsNConditions
                  : strPrivacyPolicy),
          controller.staticPageResponseModel.data == null
              ? Padding(
                  padding: EdgeInsets.symmetric(vertical: Get.width / 1.5),
                  child: Center(
                      child: Text(
                    "Info will be available soon.",
                    style: TextStyle(color: Colors.white),
                  )),
                )
              : Html(
                  data: controller.staticPageResponseModel.data?.content ??
                      'Info will be available soon.',
                  style: {
                    "table": Style(
                        fontSize: FontSize(font_13),
                        color: Colors.white,
                        fontFamily: "PublicSans",
                        backgroundColor: Colors
                            .white // Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                        ),
                    "tr": Style(
                      fontSize: FontSize(font_13),
                      color: Colors.white,
                      fontFamily: "PublicSans",
                      border: Border(bottom: BorderSide(color: Colors.grey)),
                    ),
                    "th": Style(
                      fontSize: FontSize(font_13),
                      color: Colors.white,
                      fontFamily: "PublicSans",
                      backgroundColor: Colors.grey,
                    ),
                    "td": Style(
                      fontSize: FontSize(font_13),
                      color: Colors.white,
                      fontFamily: "PublicSans",
                      alignment: Alignment.topLeft,
                    ),
                    'h5': Style(
                        fontSize: FontSize(font_13),
                        color: Colors.white,
                        fontFamily: "PublicSans",
                        maxLines: 2,
                        textOverflow: TextOverflow.ellipsis),
                    'h3': Style(
                        fontSize: FontSize(font_13),
                        color: Colors.white,
                        fontFamily: "PublicSans",
                        maxLines: 2,
                        textOverflow: TextOverflow.ellipsis),
                    'ul': Style(
                        fontSize: FontSize(font_13),
                        color: Colors.white,
                        fontFamily: "PublicSans",
                        maxLines: 2,
                        textOverflow: TextOverflow.ellipsis),
                    'li': Style(
                        fontSize: FontSize(font_13),
                        color: Colors.white,
                        fontFamily: "PublicSans",
                        maxLines: 2,
                        textOverflow: TextOverflow.ellipsis),
                    'p': Style(
                        fontSize: FontSize(font_13),
                        color: Colors.white,
                        fontFamily: "PublicSans",
                        maxLines: 2,
                        textOverflow: TextOverflow.ellipsis),
                  },
                  onLinkTap: (
                    url,
                    _,
                    __,
                  ) {
                    print("Opening $url...");
                    // launchUrlString(url??"",mode: LaunchMode.externalApplication);
                  },
                  onCssParseError: (css, messages) {
                    print("css that errored: $css");
                    print("error messages:");
                    messages.forEach((element) {
                      print(element);
                    });
                    return null;
                  },
                  // textStyle: textStyleBody1()
                )
        ],
      );
}
