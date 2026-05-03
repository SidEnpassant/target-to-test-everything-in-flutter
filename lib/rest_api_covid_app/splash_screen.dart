import 'dart:async';
import 'dart:math' as math;


import 'package:flutter/material.dart';
import 'package:testapp/rest_api_covid_app/view/world_stats.dart';


class SplashScreenCovidApp extends StatefulWidget {
  const SplashScreenCovidApp({Key? key}) : super(key: key);

  @override
  _SplashScreenCovidAppState createState() => _SplashScreenCovidAppState();
}

class _SplashScreenCovidAppState extends State<SplashScreenCovidApp> with TickerProviderStateMixin{


  late final AnimationController _controller = AnimationController(
      vsync: this,
    duration: const Duration(
      seconds: 3
    )
  )..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => WorldStats()),
        );
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            AnimatedBuilder(
                animation: _controller,
                child: Container(
                  height: 200,
                  width: 200,
                  child: const Center(
                    child: Image(
                        image: AssetImage('assets/images/virus.png'),
                    ),
                  ),
                ),
                builder: (BuildContext context , Widget? child){
                  return Transform.rotate(
                      angle: _controller.value*2.0*math.pi,
                    child: child,
                  );
                }
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.1,
            ),
            const Align(
              alignment: Alignment.center,
              child: Text('Covid-19\nTracker App',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25
              ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
