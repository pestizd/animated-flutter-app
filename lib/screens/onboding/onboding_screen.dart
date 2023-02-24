import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/screens/onboding/components/animated_btn.dart';
import 'package:rive_animation/screens/onboding/components/custom_sign_in_dialog.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  //For background animation
  bool isSignInDilogShown = false;
  //Controller to be used for animation controll
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    //Here we assure the animation doesnt play instantly
    _btnAnimationController = OneShotAnimation(
      'active',
      autoplay: false,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //This is the static colorful picture behind animation
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 200,
            left: 100,
            child: Image.asset('assets/Backgrounds/Spline.png'),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
            ),
          ),
          //Shapes animated so it seems like they are coming out of the picture behind them
          const RiveAnimation.asset('assets/RiveAssets/shapes.riv'),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(
              milliseconds: 240,
            ),
            //With this we fake the animation when button is pressed
            top: isSignInDilogShown ? -50 : 0,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    SizedBox(
                      width: 260,
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(
                            'Margins rocks!',
                            style: TextStyle(
                              fontSize: 60,
                              fontFamily: 'Poppins',
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                              'Dont skip learning, it is beneficial for you. You can learn design and programming. Also keep up the good work.')
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    //On tap we set the animation to true
                    AnimatedBtn(
                      btnAnimationController: _btnAnimationController,
                      press: () {
                        _btnAnimationController.isActive = true;
                        //We are delaying the dialog popup because of the animation
                        Future.delayed(
                          const Duration(
                            milliseconds: 800,
                          ),
                          () {
                            //Here we set the state of the background fake animation
                            setState(() {
                              isSignInDilogShown = true;
                            });
                            customSigninDialog(
                              context,
                              //When the dialog is closed return fake animation to first state
                              onClosed: (value) {
                                setState(() {
                                  isSignInDilogShown = false;
                                });
                              },
                            );
                          },
                        );
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                        'If you purchase this weeek, you get 50% off. Learn play and earn, use your knowlage.',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
