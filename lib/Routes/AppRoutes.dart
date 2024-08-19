import 'package:fitness_assign/Screens/HealthAssessmentScreen.dart';
import 'package:fitness_assign/Screens/HomeScreen.dart';
import 'package:get/get.dart';

class RoutesName {
  static const String splashScreen = '/';
  static const String homeScreen = '/HomeScreen';
  static const String healthAssessmentScreen = '/HealthAssessmentScreen';
}

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.homeScreen,
          page: () => const HomeScreen(),
        ),
        GetPage(
          name: RoutesName.healthAssessmentScreen,
          page: () => const HealthAssessmentScreen(),
        ),
      ];
}
