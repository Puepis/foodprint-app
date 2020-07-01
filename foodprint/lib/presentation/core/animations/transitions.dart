import 'package:flutter/widgets.dart';

/*
  This class defines the animated route transition where the new page
  slides from the right to the left.
*/
class SlideLeftRoute extends PageRouteBuilder {
  final Widget newPage;

  SlideLeftRoute({@required this.newPage})
      : super(
            pageBuilder: (context, animation, secondaryAnimation) => newPage,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0); // start from the right
              const end = Offset.zero;
              const curve = Curves.easeOut; // decelerate

              final tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            });
}

/*
  This class defines the animated route transition where the new page
  slides from the bottom to the top.
*/
class SlideUpEnterRoute extends PageRouteBuilder {
  final Widget newPage;

  SlideUpEnterRoute({@required this.newPage})
      : super(
            pageBuilder: (context, animation, secondaryAnimation) => newPage,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(0.0, 1.0); // start from bottom
              const end = Offset.zero;
              const curve = Curves.easeIn;

              final tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            });
}

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

/*
  Fade in route
*/
class FadeRoute extends PageRouteBuilder {
  final Widget newPage;
  FadeRoute({this.newPage})
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

/*
  Slide exit page out and slide enter page in
*/
class EnterExitRoute extends PageRouteBuilder {
  final Widget enterPage;
  final Widget exitPage;
  EnterExitRoute({this.exitPage, this.enterPage})
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
