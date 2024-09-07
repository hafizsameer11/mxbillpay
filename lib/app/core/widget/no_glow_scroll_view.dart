import 'package:flutter/widgets.dart';

class NoGlowScrollView extends StatelessWidget {
  final Widget child;

  const NoGlowScrollView({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowIndicator();
          return false;
        },
        child: child);
  }
}
