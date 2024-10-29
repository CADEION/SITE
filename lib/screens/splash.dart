import 'package:flutter/material.dart';
import 'package:site/core/constants/my_assets.dart';
import 'package:site/screens/home.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  late final List<AnimationController> _controllers;
  late final List<Animation<Offset>> _slideAnimations;
  late final List<Animation<double>> _rotationAnimations;

  @override
  void initState() {
    super.initState();

    _controllers = [
      AnimationController(vsync: this, duration: const Duration(milliseconds: 250)),
      AnimationController(vsync: this, duration: const Duration(milliseconds: 400)),
      AnimationController(vsync: this, duration: const Duration(milliseconds: 500)),
      AnimationController(vsync: this, duration: const Duration(milliseconds: 550)),
      AnimationController(vsync: this, duration: const Duration(milliseconds: 600)),
    ];

    _slideAnimations = _controllers.map((controller) {
      return Tween<Offset>(
        begin: const Offset(-1.0, 0.004), // Start from slightly below
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
    }).toList();

    _rotationAnimations = _controllers.map((controller) {
      return Tween<double>(
        begin: 0.1, // Slight clockwise rotation (in radians)
        end: 0.0,   // Ends with no rotation
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
    }).toList();

    for (int i = 0; i < _controllers.length; i++) {
      Future.delayed(Duration(milliseconds: i * 100), () => _controllers[i].forward());
    }

    moveToOnboard(context);
  }

  moveToOnboard(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 4), () {
      Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 800),  // Longer duration for smoothness
          pageBuilder: (context, animation, secondaryAnimation) => Home(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0); // Slide in from the right
            const end = Offset.zero;
            final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.easeInOutCubic));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181824),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SlideTransition(
            position: _slideAnimations[0],
            child: RotationTransition(
              turns: _rotationAnimations[0],
              child: Stack(
                children: [
                  Positioned(
                    top: 340,
                    child: SlideTransition(
                      position: _slideAnimations[0],
                      child: RotationTransition(
                        turns: _rotationAnimations[0],
                        child: Image.asset(
                          MyAssets.assetsImagesRoundBall,
                          height: 200,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 240,
                    child: SlideTransition(
                      position: _slideAnimations[1],
                      child: RotationTransition(
                        turns: _rotationAnimations[1],
                        child: Image.asset(
                          MyAssets.assetsImagesLineCircle,
                          height: 351.85,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 140,
                    child: SlideTransition(
                      position: _slideAnimations[2],
                      child: RotationTransition(
                        turns: _rotationAnimations[2],
                        child: Image.asset(
                          MyAssets.assetsImagesContentCircle,
                          height: 510.85,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 92,
                    child: SlideTransition(
                      position: _slideAnimations[3],
                      child: RotationTransition(
                        turns: _rotationAnimations[3],
                        child: Image.asset(
                          MyAssets.assetsImagesLineCircle,
                          height: 651.85,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: SlideTransition(
                      position: _slideAnimations[4],
                      child: RotationTransition(
                        turns: _rotationAnimations[4],
                        child: Image.asset(
                          MyAssets.assetsImagesLineCircle,
                          height: 751.85,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
