import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:slide_to_act/slide_to_act.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFFFEDE8),
      body: Stack(
        children: [
          Image.asset('assets/welcome_screen_bg.png', fit: BoxFit.cover),
          Container(
            height: _height,
            width: _width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 50,
                    bottom: 20,
                    left: 20,
                    right: 20,
                  ),
                  height: _height * 0.30,
                  width: _width,
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(_width * 0.05),
                      topRight: Radius.circular(_width * 0.05),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Find you Buddy, Share your Skills.',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'Connect through video lectures and exchange knowledge seamlessly',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),

                        SlideAction(
                          reversed: false,
                          submittedIcon: null,
                          borderRadius: 30,
                          elevation: 0,
                          innerColor: Color(0xFFE24C00),
                          outerColor: Colors.white, // your orange color
                          sliderRotate: false,
                          sliderButtonIcon: Center(
                            child: Text(
                              'Get Started',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          child: Container(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                  'assets/Chevron right.png',
                                  scale: 5,
                                ),
                                SizedBox(width: 5),
                                Image.asset(
                                  'assets/Chevron right.png',
                                  scale: 5,
                                ),
                                SizedBox(width: 5),
                                Image.asset(
                                  'assets/Chevron right.png',
                                  scale: 5,
                                ),
                                SizedBox(width: 20),
                              ],
                            ),
                          ),
                          onSubmit: () {
                            print("Slide action completed!");
                            context.go('/loginmethod');
                            return;
                            // Navigate or perform operation
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
