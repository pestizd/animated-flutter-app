import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FlutterAnimateScreen extends StatefulWidget {
  const FlutterAnimateScreen({super.key});

  @override
  State<FlutterAnimateScreen> createState() => _FlutterAnimateScreenState();
}

class _FlutterAnimateScreenState extends State<FlutterAnimateScreen> {
  bool buttonValue = false;

  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload = true;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 60,
              ),
              _myButton()
                  .animate(
                    onPlay: (controller) => controller.repeat(),
                  )
                  .fade(duration: 4.seconds),
              const SizedBox(
                height: 40,
              ),
              _myButton()
                  .animate(onPlay: (controller) => controller.repeat())
                  .shimmer(duration: 1800.ms)
                  .shake(hz: 4, curve: Curves.easeInOutCubic)
                  .scale(
                      begin: const Offset(1, 1),
                      end: const Offset(1.2, 1.2),
                      duration: 600.ms)
                  .then(delay: 600.ms),
              const SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  const Text("First"),
                  const Text("Second"),
                  const Text("Third")
                ]
                    .animate(
                        interval: 1.seconds,
                        onPlay: (controller) => controller.repeat())
                    .fade(
                      duration: 2.seconds,
                    ),
              ),
              const SizedBox(
                height: 40,
              ),
              Stack(
                children: [
                  Container(
                    color: Colors.red,
                    width: 100,
                    height: 100,
                  ).animate(onPlay: (controller) => controller.repeat()).flip(
                        direction: Axis.horizontal,
                        begin: 0,
                        end: 0.5,
                        duration: 2.seconds,
                        curve: Curves.easeInOut,
                      ),
                  Container(
                    color: Colors.blue,
                    width: 100,
                    height: 100,
                  ).animate(onPlay: (controller) => controller.repeat()).flip(
                        direction: Axis.horizontal,
                        begin: -0.5,
                        end: 0,
                        duration: 2.seconds,
                        delay: 400.ms,
                        curve: Curves.easeInOut,
                      ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Before",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ).animate(onPlay: (controller) => controller.repeat()).custom(
                  duration: 4.seconds,
                  builder: (context, value, child) => Center(
                        child: Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Color.lerp(Colors.red, Colors.blue, value),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Center(child: child),
                        ),
                      )),
              const SizedBox(
                height: 40,
              ),
              _myButton()
                  .animate(
                    target: buttonValue ? 1 : 0,
                  )
                  .fade(duration: 4.seconds),
            ],
          ),
        ),
      ),
    );
  }

  Container _myButton() {
    return Container(
        height: 50,
        width: 100,
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: GestureDetector(
          onTap: () {
            setState(() {
              buttonValue = !buttonValue;
            });
          },
          child: const Center(
              child: Text(
            'BUTTON',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          )),
        ));
  }
}
