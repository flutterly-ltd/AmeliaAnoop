import 'package:flutter/material.dart';

import 'model/event.dart';
import 'styles.dart';

class PastEventGridCard extends StatelessWidget {
  const PastEventGridCard({
    required this.event,
    Key? key,
  }) : super(key: key);

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Card(
        color: Colors.white70,
        shadowColor: Colors.blue[200],
        elevation: (event.category == Category.upcoming) ? 16 : 2,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Image.asset(
                      event.eventPhoto,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    event.eventName,
                    style: Styles.cardTitle,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
