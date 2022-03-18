part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const HOME = _Paths.HOME;
  static const BILL = _Paths.BILL;
  static const BMI = _Paths.BMI;
}

abstract class _Paths {
  static const HOME = '/home';
  static const BILL = '/bill';
  static const BMI = '/bmi';
}
