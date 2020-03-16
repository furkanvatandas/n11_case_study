import 'package:flutter/material.dart';
import 'package:n11casestudy/utils/extensions/extensions.dart';

class AnimatedLoading extends StatefulWidget {
  @override
  _AnimatedLoadingState createState() => _AnimatedLoadingState();
}

class _AnimatedLoadingState extends State<AnimatedLoading> with TickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: Duration(seconds: 1))..repeat(reverse: true);
    animation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeTransition(
        opacity: animation,
        child: Image.asset(
          "assets/images/n11_logo.png",
          width: 200.setWidth(),
          height: 200.setWidth(),
        ),
      ),
    );
  }
}
