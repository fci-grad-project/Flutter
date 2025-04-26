import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _checkIfSeenOnboarding();
  }

  // Check if the user has seen the onboarding screen
  _checkIfSeenOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seenOnboarding = prefs.getBool('seenOnboarding') ?? false;

    // Navigate to the next screen after a delay
    await Future.delayed(Duration(seconds: 4));  // Wait for the animation
    Navigator.pushReplacementNamed(context, '/OnboardingScreen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          children: [
            // Logo animation effect with position and scale
            TweenAnimationBuilder(
              tween: Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)), // Animate from bottom to center
              duration: Duration(seconds: 2),
              curve: Curves.easeOut,
              builder: (context, offset, child) {
                return Transform.translate(
                  offset: offset,
                  child: child,
                );
              },
              child: TweenAnimationBuilder(
                tween: Tween<double>(begin: 0.5, end: 1.5), // Zoom in effect
                duration: Duration(seconds: 2),
                builder: (context, scale, child) {
                  return Transform.scale(
                    scale: scale,
                    child: child,
                  );
                },
                child: Image.asset('assets/images/logoupdate.png', height: 150),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
