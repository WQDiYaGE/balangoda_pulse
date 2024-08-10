
class EventsExtracted {
  String title;
  DateTime date;
  String description;
  String category; // Add this field if you use it in EventDialog

  EventsExtracted({
    required this.title,
    required this.date,
    required this.description,
    this.category = '', // Default to empty string if not provided
  });
}
