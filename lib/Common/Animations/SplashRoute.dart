import 'package:flutter/material.dart';

Widget _defaultTransitionsBuilder(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return child;
}

class SplashRoute<T> extends PageRoute<T> {
  SplashRoute({
    RouteSettings? settings,
    required this.targetPage,
    this.splashColor = Colors.green,
    this.startFractionalOffset = FractionalOffset.center,
    this.transitionsBuilder = _defaultTransitionsBuilder,
    this.transitionDuration = const Duration(milliseconds: 1500),
    this.reverseTransitionDuration = const Duration(milliseconds: 300),
    this.opaque = false,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
    bool fullscreenDialog = false,
  }) : super(settings: settings, fullscreenDialog: fullscreenDialog);
  final Widget targetPage;

  final RouteTransitionsBuilder transitionsBuilder;
  final FractionalOffset startFractionalOffset;

  @override
  final Duration transitionDuration;

  @override
  final Duration reverseTransitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color? barrierColor;

  final Color splashColor;

  @override
  final String? barrierLabel;

  @override
  final bool maintainState;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: LayoutBuilder(
        builder: (context, constrains) {
          return TweenAnimationBuilder(
            duration: transitionDuration,
            tween: Tween(begin: 0.0, end: 1.0),
            child: targetPage,
            builder: (context, double value, child) {
              return ShaderMask(
                shaderCallback: (rect) {
                  return RadialGradient(
                    center: startFractionalOffset,
                    radius: value * 5,
                    colors: [
                      Colors.white,
                      Colors.white,
                      splashColor,
                      Colors.transparent,
                    ],
                    stops: const [0, 0.55, 0.60, 1.0],
                  ).createShader(rect);
                },
                child: child,
              );
            },
          );
        },
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return transitionsBuilder(context, animation, secondaryAnimation, child);
  }
}
