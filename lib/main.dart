import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'model/app_state_model.dart';

void main() {
  runApp(ChangeNotifierProvider<AppStateModel>(
      // NEW
      create: (_) => AppStateModel()..loadEvents(),
      child: const EventsApp()));
}
