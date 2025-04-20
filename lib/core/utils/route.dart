import 'package:flutter/material.dart';
import 'package:graduation_project/Ai%20Tech/screen/home_screen_AI.dart';
import 'package:graduation_project/All%20courses/screen/view_all_courses.dart';
import 'package:graduation_project/Contact%20Room/chat_view.dart';
import 'package:graduation_project/Login&Signup_Page/LoginView.dart';
import 'package:graduation_project/Login&Signup_Page/SignUpView.dart';
import 'package:graduation_project/Nav%20Bar%20Iteam/nav.dart';
import 'package:graduation_project/New%20cours%20catecore/screen/new_course_view.dart';
import 'package:graduation_project/Page%20Instractour/screen/Instractour_Dashboard.dart';
import 'package:graduation_project/ProfilePage/view_profile.dart';
import 'package:graduation_project/Splachscreen_Onbording/SplachScreen.dart';
import 'package:graduation_project/Splachscreen_Onbording/onbording_view.dart';
import 'package:graduation_project/AddTasksScreen/screen/tasks_screen.dart';
import 'package:graduation_project/exams/exams_view.dart';
import 'package:graduation_project/home%20screen/view_home_screen.dart';
import 'package:graduation_project/detaills%20cours/screen/details_screen.dart';
import 'package:graduation_project/instractour/screen/instractour_view.dart';

class AppRoutes {
  // تعريف المسارات كـ متغيرات ثابتة
  static const String home = '/HomeScreen';
  static const String login = '/LoginView';
  static const String signup = '/SignUp_View';
  static const String navBar = '/NavBar';
  static const String examsView = '/ExamsView';
  static const String chatView = '/ChatView';
  static const String detailsScreenCours = '/DetailsScreenCours';
  static const String profilePage = '/ProfilePage';
  static const String newCourse = '/CourseScreen';
  static const String instractour = '/InstructorsScreen';
  static const String coursesall = '/CoursesAll';
  static const String tasksScreen = '/TasksScreen';
  static const String profDashboard = '/ProfDashboard';
  static const String onboardingScreen = '/OnboardingScreen';
  static const String splashScreen = '/SplashScreen';
  static const String instructorProfilePage = '/InstructorProfilePage';
  static const String instructorsScreen = '/InstructorsScreen';
  static const String homeScreenAiTech = '/HomeScreenAiTech';


  // دالة تقوم بإرجاع الشاشة المطلوبة بناءً على المسار
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginView());
      case profilePage:
        return MaterialPageRoute(builder: (_) => ProfilePage());
      case signup:
        return MaterialPageRoute(builder: (_) => SignUp_View());
      case navBar:
        return MaterialPageRoute(builder: (_) => NavBar());
      case detailsScreenCours:
        return MaterialPageRoute(
            builder: (_) => DetailsScreenCours(title: 'Flutter Course'));
      case examsView:
        return MaterialPageRoute(builder: (_) => ExamsView());
      case chatView:
        return MaterialPageRoute(builder: (_) => ChatView());
        case newCourse:
        return MaterialPageRoute(builder: (_) => CourseScreen());
        case instractour:
        return MaterialPageRoute(builder: (_) => InstructorsScreen());
        case coursesall:
        return MaterialPageRoute(builder: (_) => CoursesAll());
        case tasksScreen:
        return MaterialPageRoute(builder: (_) => TasksScreen());
        case profDashboard:
        return MaterialPageRoute(builder: (_) => ProfDashboard());
        case onboardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
        case splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
        case instructorsScreen:
        return MaterialPageRoute(builder: (_) => InstructorsScreen());
        case homeScreenAiTech:
        return MaterialPageRoute(builder: (_) => HomeScreenAiTech());

        

      default:
        return MaterialPageRoute(builder: (_) => NavBar());
    }
  }
}
