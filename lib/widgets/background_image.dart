import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: Opacity(
      opacity: 0.3,
      child: Image.asset(
        "bg.png",
        fit: BoxFit.cover,
      ),
    ));
  }
}
