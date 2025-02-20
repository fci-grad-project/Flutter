import 'package:flutter/material.dart';
import 'package:graduation_project/Contact%20Room/chat_view.dart';
import 'package:graduation_project/Login&Signup_Page/SignUpView.dart';
import 'package:graduation_project/Login&Signup_Page/widget/LoginBodyView.dart';
import 'package:graduation_project/Nav%20Bar%20Iteam/nav.dart';
import 'package:graduation_project/ProfilePage/view_profile.dart';
import 'package:graduation_project/Splachscreen_Onbording/onbording_view.dart';
import 'package:graduation_project/Splachscreen_Onbording/splach_view.dart';
import 'package:graduation_project/exams/exams_view.dart';
import 'package:graduation_project/home%20screen/view_home_screen.dart';
import 'package:graduation_project/view%20cours/screen/details_screen.dart';

class AppRoutes {
  // تعريف المسارات كـ متغيرات ثابتة
  static const String home = '/HomeScreen';
  static const String login = '/LoginView';
  static const String signup = '/SignUp_View';
  static const String navBar = '/NavBar';
  static const String examsView = '/ExamsView';
  static const String chatView = '/ChatView';
  static const String detailsScreenCours = '/DetailsScreenCours';
  static const String onbordingView = '/OnbordingView';
  static const String splachScreenView = '/SplachScreenView';
  static const String profilePage = '/ProfilePage';

  // دالة تقوم بإرجاع الشاشة المطلوبة بناءً على المسار
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case profilePage:
        return MaterialPageRoute(builder: (_) => ProfilePage());
        case signup:
        return MaterialPageRoute(builder: (_) => SignUp_View());
        case  navBar:
        return MaterialPageRoute(builder: (_) => NavBar());
        case detailsScreenCours:
        return MaterialPageRoute(builder: (_) => DetailsScreenCours(title: 'Flutter Course',));
        case onbordingView:
        return MaterialPageRoute(builder: (_) => OnbordingView());
        case splachScreenView:
        return MaterialPageRoute(builder: (_) => SplachScreenView());
        case examsView:
        return MaterialPageRoute(builder: (_) => ExamsView());
        case chatView:
        return MaterialPageRoute(builder: (_) => ChatView());
        
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
