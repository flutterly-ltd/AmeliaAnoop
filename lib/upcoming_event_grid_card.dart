import 'package:flutter/material.dart';

import 'model/event.dart';
import 'styles.dart';

class UpcomingEventGridCard extends StatelessWidget {
  const UpcomingEventGridCard({
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
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: double.infinity,
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
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        event.eventName,
                        style: Styles.cardTitle,
                      ),
                      Text(
                        event.eventDate,
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
