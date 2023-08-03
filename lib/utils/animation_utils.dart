import 'package:flutter/animation.dart';

class AnimationUtils {
  static AnimationController initAnimationController({
    required TickerProvider vsync,
    required Duration duration,
    required VoidCallback onDispose,
  }) {
    final controller = AnimationController(duration: duration, vsync: vsync,);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        onDispose();
      }
    });
    return controller;
  }

  static void disposeAnimationController(AnimationController controller) {
    controller.dispose();
  }

  static Animation<T> setupAnimation<T>({
    required AnimationController controller,
    required T begin,
    required T end,
    Curve curve = Curves.easeOut,
  }) {
    return Tween<T>(begin: begin, end: end).animate(
      CurvedAnimation(parent: controller, curve: curve),
    );
  }

  static Future<void> fadeOutAndSlideUp(
    AnimationController controller,
    Animation<double> opacityAnimation,
    Animation<Offset> slideAnimation,
  ) {
    return controller.forward().then((_) {
      // Animation complete
    });
  }
}
