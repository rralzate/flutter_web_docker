import '../../screens/no_page_found_screen.dart';
import 'package:fluro/fluro.dart';

//! No page view handler
class NoPageFoundHandlers {
  static Handler noPageFound = Handler(handlerFunc: (
    context,
    params,
  ) {
    return const NoPageFoundScreen();
  });
}
