import 'dart:convert';
import 'dart:math';

import 'package:EarlybazeWallet/app/modules/chat/Model/chat_list_response_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../export.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint("Handling a background message: ${message.data}");
  // Add your custom logic to handle the background message here
}

class PushNotificationsManager {
  PushNotificationsManager._();

  factory PushNotificationsManager() => _instance;
  static final PushNotificationsManager _instance = PushNotificationsManager._();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  bool _initialized = false;
  bool comingFromNotification = false;
  Map notificationMap = {};

  Future<void> init() async {
    if (!_initialized) {
      await Firebase.initializeApp();

      // For iOS request permission first.
      _firebaseMessaging.requestPermission(alert: true, sound: true);
      _firebaseMessaging.setForegroundNotificationPresentationOptions(alert: true, badge: false, sound: true);

      // For testing purposes, print the Firebase Messaging token
      _firebaseMessaging.getToken().then((value) => debugPrint("Firebase Messaging token $value"));
      // For testing purposes print the Firebase Messaging token
      _firebaseMessaging.getToken().then((value) {
        deviceToken = value ?? "empty";
        debugPrint("Firebase Messaging token $value");
      });

      onMessage();
      onAppOpened();
      FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
      _initialized = true;
    }
  }

  getInitialMessage() {
    _firebaseMessaging.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        notificationRedirection(message.data);
      }
    });
  }

  onMessage() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      // app foreground
      var notification = message.data;
      var androids = AndroidInitializationSettings('@drawable/notification_icon');
      var ios = new IOSInitializationSettings(defaultPresentBadge: false, requestBadgePermission: false);
      var platform = new InitializationSettings(android: androids, iOS: ios);
      flutterLocalNotificationsPlugin.initialize(platform, onSelectNotification: (String? data) async {
        notificationRedirection(message.data);
      });

      if (Platform.isAndroid) {
        var androidPlatformChannelSpecifics = AndroidNotificationDetails(
          'com.app.earlybaze_wallet',
          'earlybaze_wallet',
          icon: '@drawable/notification_icon',
          importance: Importance.max,
          groupKey: "earlybaze_wallet",
          setAsGroupSummary: true,
          groupAlertBehavior: GroupAlertBehavior.all,
          playSound: true,
          enableVibration: true,
        );
        var iOSPlatformChannelSpecifics = IOSNotificationDetails();
        var platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
        var rng = Random();
        String description = (message.data['description'].toString().replaceAll("<p>", "")).replaceAll("</p>", "");
        await flutterLocalNotificationsPlugin.show(rng.nextInt(1000), message.data["title"], description, platformChannelSpecifics, payload: jsonEncode(notification));
      }
    });
  }

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlText.replaceAll(exp, '');
  }

  onAppOpened() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      notificationRedirection(message.data);
    });
  }

  notificationRedirection(Map data) async {
    comingFromNotification = true;
    notificationMap = data;
    if (data["notification_type"] == "3") {
      print("notification_type");
      try {
        print("try");
        MainScreenController mainScreenController = Get.find<MainScreenController>();
        if (Get.previousRoute == AppPages.INITIAL) {
          print("if");
          mainScreenController.updateBottomNavIndex(2);
        } else {
          print("else");
          Get.offAllNamed(AppRoutes.mainScreen, arguments: {"bottom": 2});
          mainScreenController.updateBottomNavIndex(2);
        }
      } catch (e) {
        print("catch");
        MainScreenController mainScreenController = Get.put(MainScreenController());
        mainScreenController.updateBottomNavIndex(2);
        Get.offAllNamed(AppPages.INITIAL);
      }
    } else if (data["notification_type"].toString() == "1") {
      ReceiverData receiverData =
          ReceiverData(id: data["object_id"], service: Service(id: data["service_id"], title: data["service_name"]), receiver: Receiver(id: data["receiver_id"]));
      Get.offAllNamed(AppRoutes.MessagingScreen, arguments: {"isFromChat": false, "receiverDetails": receiverData});
    } else if (data["notification_type"].toString() == "2") {
      ReceiverData receiverData =
          ReceiverData(id: data["object_id"], service: Service(id: data["service_id"], title: data["service_name"]), receiver: Receiver(id: data["receiver_id"]));
      Get.offAllNamed(AppRoutes.MessagingScreen, arguments: {"isFromChat": false, "receiverDetails": receiverData});
    }
  }
}
