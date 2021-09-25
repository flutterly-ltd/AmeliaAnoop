// ignore_for_file: must_be_immutable

import 'package:amelia_anoop_events/styles/text_styles.dart';
import 'package:flutter/material.dart';

import 'functions/no_transitions_on_web.dart';
import 'widgets/amelia_avatar.dart';
import 'widgets/background_image.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashPage(
      duration: 3,
      goToPage: const WelcomePage(),
    ),
    theme: ThemeData(
      pageTransitionsTheme: NoTransitionsOnWeb(),
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
            color: Colors.black,
            child: Stack(
              children: [
                const BackgroundImage(),
                Align(
                  alignment: Alignment.center,
                  child: AmeliaAvatar(
                    size: 200,
                  ),
                ),
              ],
            )));
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.black,
          child: Stack(
            children: [
              const SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: BackgroundImage()),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Row(
                  children: [
                    AmeliaAvatar(
                      size: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Amelia Anoop",
                        style: titleStyle,
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
