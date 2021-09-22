// ignore_for_file: file_names

import 'package:amelia_anoop_events/data/eventListData.dart';
import 'package:amelia_anoop_events/views/EventsView/EventsGridView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class EventsListView extends StatefulWidget {
  const EventsListView({Key? key}) : super(key: key);

  @override
  _EventsListViewState createState() => _EventsListViewState();
}

class _EventsListViewState extends State<EventsListView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Foreground(),
    );
  }
}

class Foreground extends StatelessWidget {
  const Foreground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const CupertinoSliverNavigationBar(
          backgroundColor: Colors.white38,
          largeTitle: Text("Amelia Anoop"),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
              height: (MediaQuery.of(context).size.width > 600) ? 500 : 300,
              child: Image.asset(
                "amelia.png",
                fit: BoxFit.cover,
                alignment: const Alignment(0, -0.5),
              )),
        ),
        const SliverToBoxAdapter(
            child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "My Upcoming Events",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )),
        EventsGridView(eventType: upcomingEventsList),
        const SliverToBoxAdapter(
            child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Divider(),
        )),
        const SliverToBoxAdapter(
            child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "My Past Events",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )),
        EventsGridView(eventType: pastEventsList)
      ],
    );
  }
}
