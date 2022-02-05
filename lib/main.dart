import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:onboarding/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "First",
          body: "This is first Description",
          image: Image.asset(
            "images/onboard1.png",
            width: 350,
          ),
        ),
        PageViewModel(
          title: "Second",
          body: "This is second Description",
          image: Image.asset(
            "images/onboard2.png",
            width: 350,
          ),
        ),
        PageViewModel(
          title: "Third",
          body: "This is third Description",
          image: Image.asset(
            "images/onboard3.png",
            width: 350,
          ),
        ),
      ],
      onDone: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      },
      done: Text("Done"),
      showSkipButton: true,
      skip: Text("Skip"),
      showNextButton: true,
      next: Text("Next"),
    );
  }
}
