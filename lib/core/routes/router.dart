import 'package:fluro/fluro.dart';

import 'handlers/home_handlers.dart';
import 'handlers/admin_handlers.dart';
import 'handlers/no_page_found_handlres.dart';
import 'routes_constants.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static void defineRoutes() {
    //!auth routes
    router.define(RoutesConstants.rootRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(RoutesConstants.loginRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);

    router.define(RoutesConstants.registerRoute,
        handler: AdminHandlers.register, transitionType: TransitionType.none);

    //!Home Screen
    router.define(RoutesConstants.dashBoardRoute,
        handler: HomeHandler.home, transitionType: TransitionType.fadeIn);

    //404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
