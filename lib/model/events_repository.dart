import 'event.dart';

class EventsRepository {
  static const _allEvents = <Event>[
    Event(
        id: 1,
        category: Category.upcoming,
        isFeatured: true,
        eventName: "1st Birthday",
        eventAddress: "Flat 21, 3 Erleigh Road, Reading",
        eventPhoto: "amelia.png",
        eventDate: "October 18, 2021"),
    Event(
        id: 0,
        category: Category.past,
        isFeatured: false,
        eventName: "Christening",
        eventAddress: "St. James Catholic Church, Forbury Road, Reading",
        eventPhoto: "amelia_christening.jpg",
        eventDate: "June 27, 2021"),
  ];

  static List<Event> loadEvents(Category category) {
    if (category == Category.all) {
      return _allEvents;
    } else {
      return _allEvents.where((p) => p.category == category).toList();
    }
  }
}
