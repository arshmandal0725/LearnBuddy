import 'package:go_router/go_router.dart';
import 'package:learnbuddy/view/bottom_nav_bar/screen/bottom_nav_screen.dart';
import 'package:learnbuddy/view/chatting_screen/screens/chatting_screen.dart';
import 'package:learnbuddy/view/login/screens/login_methods_screen.dart';
import 'package:learnbuddy/view/login/screens/login_screen.dart';
import 'package:learnbuddy/view/starting%20/screens/splash_screen.dart';
import 'package:learnbuddy/view/starting%20/screens/welcome_screen.dart';

GoRouter goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return SplashScreen();
      },
    ),
    GoRoute(
      path: '/welcome',
      builder: (context, state) {
        return WelcomeScreen();
      },
    ),
    GoRoute(
      path: '/loginmethod',
      builder: (context, state) {
        return LoginMethodsScreen();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) {
        return LoginScreen();
      },
    ),
    GoRoute(
      path: '/bottomnav',
      builder: (context, state) {
        return BottomNavScreen();
      },
    ),
    GoRoute(
      path: '/chatscreen',
      builder: (context, state) {
        return ChatScreen();
      },
    ),
  ],
);
