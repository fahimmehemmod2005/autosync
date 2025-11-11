part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const splashScreen = _Paths.splashScreen;
  static const loginScreen = _Paths.loginScreen;
  static const signupScreen = _Paths.signupScreen;
  static const forgotScreen = _Paths.forgotScreen;
  static const otpScreen = _Paths.otpScreen;
  static const resetpassScreen = _Paths.resetpassScreen;
  static const emailvrificationScreen = _Paths.emailvrificationScreen;
  static const mainScreen = _Paths.mainScreen;

}

abstract class _Paths {
  _Paths._();

  static const splashScreen = '/splash_screen';
  static const loginScreen = '/login_screen';
  static const signupScreen = '/signup_screen';
  static const forgotScreen = '/forgot_screen';
  static const otpScreen = '/otp_screen';
  static const resetpassScreen = '/resetpass_screen';
  static const emailvrificationScreen = '/emailvrification_screen';
  static const mainScreen = '/main_screen'; 

}