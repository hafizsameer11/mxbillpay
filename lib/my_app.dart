/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

import 'package:navigation_history_observer/navigation_history_observer.dart';

import 'app/core/translations/translation_service.dart';
import 'app/export.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: ScreenUtilInit(
        useInheritedMediaQuery: true,
        builder: (context, widget) => GetMaterialApp(
          theme: ThemeData(primaryColor: Colors.white, fontFamily: "lexend"),
          initialRoute: AppPages.INITIAL,
          initialBinding: InitialBinding(),
          getPages: AppPages.routes,
          translations: TranslationService(),
          locale: TranslationService.locale,
          scaffoldMessengerKey: scaffoldMessengerState,
          navigatorKey: navState,
          debugShowCheckedModeBanner: false,
          enableLog: true,
          logWriterCallback: LoggerX.write,
          navigatorObservers: [NavigationHistoryObserver()],
          builder: EasyLoading.init(),
          defaultTransition: Transition.cupertino,
        ),
      ),
    );
  }
}
