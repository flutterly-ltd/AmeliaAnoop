// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'widgets/amelia_avatar.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashPage(
      duration: 3,
      goToPage: const WelcomePage(),
    ),
  ));
}

class SplashPage extends StatelessWidget {
  SplashPage({Key? key, this.duration, this.goToPage}) : super(key: key);

  int? duration;
  Widget? goToPage;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: duration!), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => goToPage!));
    });
    return Scaffold(
        body: Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: AmeliaAvatar(
        size: 200,
      ),
    ));
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: const Text("Hello world!"),
      ),
    );
  }
}
