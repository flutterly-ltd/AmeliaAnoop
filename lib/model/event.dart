enum Category {
  all,
  upcoming,
  past,
}

class Event {
  const Event({
    required this.category,
    required this.id,
    required this.isFeatured,
    required this.eventName,
    required this.eventAddress,
    required this.eventDate,
    required this.eventPhoto,
  });

  final Category category;
  final int id;
  final bool isFeatured;
  final String eventName;
  final String eventAddress;
  final String eventPhoto;
  final String eventDate;

  @override
  String toString() => '$eventName(id=$id)';
}
