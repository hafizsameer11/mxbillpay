/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_logger/FlutterLogger.dart';
import 'package:path_provider/path_provider.dart';

import 'app/export.dart';
import 'app/modules/notification/push_notification_manager.dart';

CustomLoader customLoader = CustomLoader();
GetStorage localStorage = GetStorage();
FlutterLogger flutterLogger = FlutterLogger.getInstance();
APIRepository repository = APIRepository();
PreferenceManger preferenceManger = Get.put(PreferenceManger());
var deviceToken;

/*Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  orientation();
  await Firebase.initializeApp();
  await PushNotificationsManager().init();
  debugPrint("Device Token $deviceToken");
  FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
    debugPrint("FirebaseMessaging.getInitialMessage $message");
  });
  errorCrashLogger();
  initApp();
}*/

errorCrashLogger() {
  flutterLogger.init(reportURL: crashBaseUrl);
}

/*init() async {
  await GetStorage.init();
  // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  APIRepository();
}*/

/*
initApp() async {
  // runZonedGuarded(() {
  //   runApp(MyApp());
  // }, (error, stack) {
  //   debugPrint("error Received $error");
  // });
  runApp(MyApp());
}
*/

/*
orientation() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light,
  );
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.light));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}
*/

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  orientation();
  APIRepository();
  await Firebase.initializeApp();
  await PushNotificationsManager().init();
  deviceToken = await FirebaseMessaging.instance.getToken();

  FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
    debugPrint("FirebaseMessaging.getInitialMessage $message");
  });
  errorCrashLogger();
  runApp(const MyApp());
}

init() async {
  await GetStorage.init();
  // flutterLogger.init(reportURL: crashBaseUrl);
  /*var dir =*/
  await getApplicationDocumentsDirectory();
}

orientation() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light,
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.black,
  ));
}
