import 'package:autosync/app/models/splash%20&%20Login%20Authentication/auth/email_verification.dart';
import 'package:autosync/app/models/splash%20&%20Login%20Authentication/auth/forgot%20screen/forgot_screen.dart';
import 'package:autosync/app/models/splash%20&%20Login%20Authentication/auth/forgot%20screen/otp_screen.dart';
import 'package:autosync/app/models/splash%20&%20Login%20Authentication/auth/forgot%20screen/resetpass_screen.dart';
import 'package:autosync/app/models/splash%20&%20Login%20Authentication/auth/login_screen.dart';
import 'package:autosync/app/models/splash%20&%20Login%20Authentication/auth/signup_screen.dart';
import 'package:autosync/app/models/splash%20&%20Login%20Authentication/splash_screen.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class appPages {
  appPages._();

  static const initialRoute = Routes.splashScreen;

  static final routes = [
    GetPage(name: _Paths.splashScreen, page: () => SplashScreen()),
    GetPage(name: _Paths.loginScreen, page: () => LoginScreen()),
    GetPage(name: _Paths.signupScreen, page: () => SignupScreen()),
    GetPage(name: _Paths.forgotScreen, page: () => ForgotScreen()),
    GetPage(name: _Paths.otpScreen, page: () => OtpScreen()),
    GetPage(name: _Paths.resetpassScreen, page: () => ResetpassScreen()),
    GetPage(name: _Paths.emailvrificationScreen, page: () => EmailVerificationScreen()),
  ];
}
