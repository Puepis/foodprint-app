import 'package:flutter/widgets.dart';

/// An animated route transition where the new page slides in from the right.
/// 
/// Uses a [easeOutCubic] animation curve to decelerate the motion.
class SlideLeftRoute extends PageRouteBuilder {
  final Widget newPage;

  SlideLeftRoute({@required this.newPage})
      : super(
            pageBuilder: (context, animation, secondaryAnimation) => newPage,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0); // start from the right
              const end = Offset.zero;
              const curve = Curves.easeOutCubic; // decelerate

              final tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            });
}

/// An animated route transition where the new page slides in from the bottom.
/// 
/// Uses a [easeOutCubic] animation curve to decelerate the motion.
class SlideUpEnterRoute extends PageRouteBuilder {
  final Widget newPage;

  SlideUpEnterRoute({@required this.newPage})
      : super(
            pageBuilder: (context, animation, secondaryAnimation) => newPage,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(0.0, 1.0); // start from bottom
              const end = Offset.zero;
              const curve = Curves.easeOutExpo;

              final tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            });
}

/// An animated route transition where the page exits by sliding down.
/// 
/// To be used as the ending animation to [SlideUpEnterRoute]. Uses a [easeIn] 
/// animation curve to accelerate the motion.
class SlideDownExitRoute extends PageRouteBuilder {
  final Widget newPage;

  SlideDownExitRoute({@required this.newPage})
      : super(
            pageBuilder: (context, animation, secondaryAnimation) => newPage,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset.zero; // start from bottom
              const end = Offset(0.0, 1.0);
              const curve = Curves.easeIn;

              final tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            });
}

/// An animated route transition where the new page fades in.
/// 
class FadeRoute extends PageRouteBuilder {
  final Widget newPage;
  FadeRoute({@required this.newPage})
      : super(
            pageBuilder: (
              context,
              animation,
              secondaryAnimation,
            ) =>
                newPage,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            });
}

/// An animated route transition where the current page slides out to the left
/// while the new page slides in from the right. 
/// 
/// Uses a [easeInOut] animation curve to introduce non-linear motion. 
class EnterExitRoute extends PageRouteBuilder {
  final Widget enterPage;
  final Widget exitPage;
  EnterExitRoute({@required this.exitPage, @required this.enterPage})
      : super(
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) =>
                enterPage,
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) {
              return Stack(
                children: <Widget>[
                  SlideTransition(
                    position: animation.drive(
                      Tween(
                        begin: Offset.zero,
                        end: const Offset(-1.0, 0.0) 
                      ).chain(
                        CurveTween(
                          curve: Curves.easeInOut
                        )
                      )
                    ),
                    child: exitPage,
                  ),
                  SlideTransition(
                    position: animation.drive(
                      Tween(
                        begin: const Offset(1.0, 0.0),
                        end: Offset.zero 
                      ).chain(
                        CurveTween(
                          curve: Curves.easeOut
                        )
                      )
                    ),
                    child: enterPage,
                  ),
                ],
              );
            });
}
