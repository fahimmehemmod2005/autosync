import 'package:autosync/app/models/splash%20&%20Login%20Authentication/splash_screen.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class appPages {
  appPages._();

  static const initialRoute = Routes.splashScreen;

  static final routes = [
    GetPage(name: _Paths.splashScreen, page: () => SplashScreen()),
  ];
}
