// ignore_for_file: file_names

import 'package:amelia_anoop_events/data/eventListData.dart';
import 'package:amelia_anoop_events/models/eventsListModel.dart';
import 'package:flutter/material.dart';

class EventsGridView extends StatelessWidget {
  const EventsGridView({Key? key, required this.eventType}) : super(key: key);

  final List<EventListItem>? eventType;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 500.0,
        mainAxisSpacing: 2.0,
        crossAxisSpacing: 2.0,
        childAspectRatio:
            (eventType == upcomingEventsList) ? (2.5 / 2) : (2.5 / 1),
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 1))
                  ],
                  gradient: LinearGradient(
                      colors: eventType![index].gradientColors,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    eventType![index].eventName,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    eventType![index].eventDate,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
          );
        },
        childCount: eventType!.length,
      ),
    );
  }
}
