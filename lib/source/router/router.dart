import 'package:flutter/material.dart';
import 'package:sihr/source/router/string.dart';

import '../pages/index.dart';

class RouterNavigation {
  SlideTransition bottomToTop(context, animation, secondaryAnimation, child) {
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    const curve = Curves.ease;
    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    return SlideTransition(position: animation.drive(tween), child: child);
  }

  SlideTransition topToBottom(context, animation, secondaryAnimation, child) {
    const begin = Offset(0.0, -1.0);
    const end = Offset.zero;
    const curve = Curves.ease;
    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    return SlideTransition(position: animation.drive(tween), child: child);
  }

  SlideTransition rightToLeft(context, animation, secondaryAnimation, child) {
    const begin = Offset(1.0, 0.0);
    const end = Offset.zero;
    const curve = Curves.easeInOut;
    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    var offsetAnimation = animation.drive(tween);
    return SlideTransition(position: offsetAnimation, child: child);
  }

  SlideTransition leftToRight(context, animation, secondaryAnimation, child) {
    const begin = Offset(-1.0, 0.0);
    const end = Offset.zero;
    const curve = Curves.easeInOut;
    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    var offsetAnimation = animation.drive(tween);
    return SlideTransition(position: offsetAnimation, child: child);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const SplashScreen(),
          transitionsBuilder: bottomToTop,
        );
      case loginScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const LoginScreen(),
          transitionsBuilder: bottomToTop,
        );
      case dashboardScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const DashboardScreen(),
          transitionsBuilder: topToBottom,
        );
      case profileScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const ProfileScreen(),
          transitionsBuilder: topToBottom,
        );
      case absensiScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const AbsensiScreen(),
          transitionsBuilder: rightToLeft,
        );
      case dataAbsensiScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const DataAbsensiScreen(),
          transitionsBuilder: rightToLeft,
        );
      // lembur
      case lemburScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const LemburScreen(),
          transitionsBuilder: rightToLeft,
        );
      case createLemburScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const CreateLemburScreen(),
          transitionsBuilder: rightToLeft,
        );
      // cuti
      case cutiScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const CutiScreen(),
          transitionsBuilder: rightToLeft,
        );
      case createCutiScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const CreateCutiScreen(),
          transitionsBuilder: rightToLeft,
        );
      // izin
      case izinScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const IzinScreen(),
          transitionsBuilder: rightToLeft,
        );
      case createIzinScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const CreateIzinScreen(),
          transitionsBuilder: rightToLeft,
        );
      // news
      case newsScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const NewsScreen(),
          transitionsBuilder: rightToLeft,
        );
      // pelatihan
      case pelatihanScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const PelatihanScreen(),
          transitionsBuilder: rightToLeft,
        );
      // Log Book
      case logbookScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const LogBookScreen(),
          transitionsBuilder: rightToLeft,
        );
      case createlogbookScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const CreateLogBookScreen(),
          transitionsBuilder: rightToLeft,
        );
      case updatelogbookScreen:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) => const UpdateLogBookScreen(),
          transitionsBuilder: rightToLeft,
        );

      default:
        return null;
    }
  }
}
