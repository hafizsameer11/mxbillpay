/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */


import 'package:connectivity_plus/connectivity_plus.dart';

import '../../export.dart';


class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
        stream: Connectivity().onConnectivityChanged.cast<ConnectivityResult>(),
        builder: (context, AsyncSnapshot<ConnectivityResult> snapshot) {
          debugPrint('ConnectivityResult ${snapshot.data}');

          return snapshot.data == ConnectivityResult.none
              ? _noInternetUI()
              : FutureBuilder<bool>(
                  future: checkInternet(),
                  builder: (context, AsyncSnapshot<bool> snapshot) {
                    debugPrint('InternetConnectionStatus ${snapshot.data}');
                    return snapshot.data == true
                        ? SizedBox(
                            height: 0,
                            width: 0,
                          )
                        : _noInternetUI();
                  });
        });
  }

  Widget _noInternetUI() {
    return Container(
      color: appColor,
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: margin_10, vertical: margin_5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.signal_cellular_connected_no_internet_4_bar_rounded,
            color: Colors.white,
            size: height_15,
          ).marginOnly(right: margin_5),
          TextView(text: stringInternetConnection,
              textStyle: textStyleTitle3().copyWith(color: Colors.white)),
        ],
      ),
    );
  }

  Future<bool>? checkInternet() async {
    try {
      final result = await InternetAddress.lookup('www.google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        return true;
      }
    } on SocketException catch (_) {
      print('not connected');
      return false;
    }
    return false;
  }
}
