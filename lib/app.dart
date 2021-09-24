import 'package:amelia_anoop_events/upcoming_event_grid_card.dart';
import 'package:amelia_anoop_events/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'model/app_state_model.dart';
import 'model/event.dart';
import 'past_event_grid_card.dart';

class EventsApp extends StatelessWidget {
  const EventsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const EventsAppHomePage(),
    );
  }
}

class EventsAppHomePage extends StatefulWidget {
  const EventsAppHomePage({Key? key}) : super(key: key);

  @override
  State<EventsAppHomePage> createState() => _EventsAppHomePageState();
}

class _EventsAppHomePageState extends State<EventsAppHomePage> {
  late final TextEditingController _controller;

  late final FocusNode _focusNode;

  String _terms = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()..addListener(_onTextChanged);
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _terms = _controller.text;
    });
  }

  Widget _buildSearchBox() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SearchBar(
        controller: _controller,
        focusNode: _focusNode,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: []);
    final model = Provider.of<AppStateModel>(context);
    final results = model.search(_terms);

    List<Event> getUpcomingEvents() {
      return results.where((element) {
        return element.category == Category.upcoming;
      }).toList();
    }

    List<Event> getPastEvents() {
      return results.where((element) {
        return element.category == Category.past;
      }).toList();
    }

    return Stack(
      children: [
        SafeArea(
          right: false,
          left: false,
          top: false,
          bottom: false,
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.blue[100]!,
              Colors.purple[100]!,
              Colors.blueGrey[100]!
            ])),
          ),
        ),
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text("Amelia Anoop"),
            backgroundColor: Colors.white.withOpacity(0.0),
            elevation: 1,
            shadowColor: Colors.black26,
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: [
                _buildSearchBox(),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 600,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    childAspectRatio: 400 / 450,
                  ),
                  itemBuilder: (context, index) {
                    return UpcomingEventGridCard(
                      event: getUpcomingEvents()[index],
                    );
                  },
                  itemCount: getUpcomingEvents().length,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text("Past Events"),
                ),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 600,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    childAspectRatio: 2,
                  ),
                  itemBuilder: (context, index) {
                    return PastEventGridCard(
                      event: getPastEvents()[index],
                    );
                  },
                  itemCount: getPastEvents().length,
                ),
                const SizedBox(
                  height: 50,
                ),
                const Center(
                    child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Designed and Developed by Flutterly Ltd."),
                ))
              ],
            ),
          ),
        )
      ],
    );
  }
}
