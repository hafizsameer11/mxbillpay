/*
 *
 *  * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 *  * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 *  * All Rights Reserved.
 *  * Proprietary and confidential :  All information contained herein is, and remains
 *  * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 *  * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import '../../export.dart';

class DoubleBack extends StatefulWidget {
  final Widget child;
  final int waitForSecondBackPress;
  final Function? onFirstBackPress;
  final bool condition;
  final VoidCallback? onConditionFail;
  final TextStyle textStyle;
  final Color background;
  final isDoubleBackEnable;
  final double backgroundRadius;

  /// DoubleBack, wrap a widget to use it
  const DoubleBack({
    Key? key,
    required this.child,
    this.waitForSecondBackPress = 2,
    this.onFirstBackPress,
    this.isDoubleBackEnable=true,
    this.condition = true,
    this.onConditionFail,
    this.textStyle = const TextStyle(fontSize: 14, color: Colors.white),
    this.background = const Color(0xAA000000),
    this.backgroundRadius = 20,
  }) : super(key: key);

  @override
  _DoubleBackState createState() => _DoubleBackState();
}

class _DoubleBackState extends State<DoubleBack> {
  bool tapped = false;

  bool get _isAndroid => Theme.of(context).platform == TargetPlatform.android;

  @override
  Widget build(BuildContext context) {
    if (_isAndroid) {
      return WillPopScope(
        onWillPop: () async {
          if(widget.isDoubleBackEnable) {
            if (widget.condition) {
              if (tapped) {
                return true;
              } else {
                tapped = true;
                Timer(
                  Duration(
                    seconds: widget.waitForSecondBackPress,
                  ),
                  resetBackTimeout,
                );

                if (widget.onFirstBackPress != null) {
                  widget.onFirstBackPress!(context);
                } else {
                  showInSnackBar(message: pressToExitApp);
                }
                return false;
              }
            } else {
              if (widget.onConditionFail != null) {
                widget.onConditionFail!();
              }
              return false;
            }
          }else{
            Get.back();
            return false;
          }
        },
        child: widget.child,
      );
    } else {
      return widget.child;
    }
  }

  void resetBackTimeout() {
    tapped = false;
  }
}
