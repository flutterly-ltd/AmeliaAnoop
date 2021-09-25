// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class AmeliaAvatar extends StatelessWidget {
  AmeliaAvatar({Key? key, this.size}) : super(key: key);
  double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: const Hero(
        tag: "amelia_avatar",
        child: Card(
          shape: CircleBorder(),
          color: Colors.white,
          elevation: 10,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              foregroundColor: Colors.white,
              backgroundColor: Colors.white,
              foregroundImage: AssetImage("amelia.png"),
            ),
          ),
        ),
      ),
    );
  }
}
