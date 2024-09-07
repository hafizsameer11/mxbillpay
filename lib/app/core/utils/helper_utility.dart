// import 'package:open_filex/open_filex.dart';
import '../../export.dart';

Widget getInkWell(
    {child, onTap, onLongPress, GestureTapDownCallback? onTapDown}) {
  return InkWell(
    onTapDown: onTapDown,
    onLongPress: onLongPress,
    onTap: onTap,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    focusColor: Colors.transparent,
    // splashColor: Colors.transparent,
    child: child,
  );
}
