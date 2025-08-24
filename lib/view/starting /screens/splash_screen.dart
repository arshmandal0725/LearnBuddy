import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      context.go('/welcome');
    });
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: _height * 0.1),
            SizedBox(
              height: _height * 0.35,
              width: _width * 0.45,
              child: Image.asset('assets/splash_screen_image.png'),
            ),
            SizedBox(height: _height * 0.1),
            LoadingAnimationWidget.flickr(
              leftDotColor: Color(0xFFE24C00),
              rightDotColor: Color(0xFFE24C00),
              size: _width * 0.1,
            ),
          ],
        ),
      ),
    );
  }
}
