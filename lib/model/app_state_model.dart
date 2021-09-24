import 'package:flutter/foundation.dart' as foundation;

import 'event.dart';
import 'events_repository.dart';

class AppStateModel extends foundation.ChangeNotifier {
  // All the available events.
  List<Event> _availableEvents = [];

  // The currently selected category of events.
  Category _selectedCategory = Category.all;

  Category get selectedCategory {
    return _selectedCategory;
  }

  // Returns a copy of the list of available events, filtered by category.
  List<Event> getEvents() {
    if (_selectedCategory == Category.all) {
      return List.from(_availableEvents);
    } else {
      return _availableEvents.where((e) {
        return e.category == _selectedCategory;
      }).toList();
    }
  }

  // Search the product catalog
  List<Event> search(String searchTerms) {
    return getEvents().where((event) {
      return event.eventName.toLowerCase().contains(searchTerms.toLowerCase());
    }).toList();
  }

  Event getEventById(int id) {
    return _availableEvents.firstWhere((p) => p.id == id);
  }

  // Loads the list of available events from the repo.
  void loadEvents() {
    _availableEvents = EventsRepository.loadEvents(Category.all);
    notifyListeners();
  }

  void setCategory(Category newCategory) {
    _selectedCategory = newCategory;
    notifyListeners();
  }
}
