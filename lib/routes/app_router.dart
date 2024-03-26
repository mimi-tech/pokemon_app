import 'package:auto_route/auto_route.dart';

import  'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
    /// routes go here
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: CounterRoute.page),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: ViewAllRoute.page),


  ];
}