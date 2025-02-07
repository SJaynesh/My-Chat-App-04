import 'package:get/get.dart';
import 'package:my_chat_app/screen/auth/login_screen.dart';
import 'package:my_chat_app/screen/auth/register_screen.dart';
import 'package:my_chat_app/screen/chat/chat_page.dart';
import 'package:my_chat_app/screen/home/home_screen.dart';

import '../screen/splash/splash_screen.dart';

class Routes {
  static String splash = '/';
  static String login = '/login';
  static String register = '/register';
  static String home = '/home';
  static String chat = '/chat';

  static List<GetPage> pages = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: login,
      page: () => const LoginScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: register,
      page: () => const RegisterScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: home,
      page: () => const HomeScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: chat,
      page: () => const ChatPage(),
      transition: Transition.cupertino,
    ),
  ];
}
