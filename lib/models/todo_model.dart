class TodoCardModel {
  late final String title;
  late final DateTime date;
  final int id;
  bool isCompleted;

  TodoCardModel({
    required this.title,
    required this.date,
    required this.id,
    required this.isCompleted,
  });

  // Factory method to create TodoCardModel from map
  factory TodoCardModel.fromMap(Map<String, dynamic> map) {
    return TodoCardModel(
      title: map['title'],
      date: DateTime.parse(map['date']),
      id: map['id'],
      isCompleted: map['state'] == false, // Map database state to isCompleted
    );
  }

  // Method to convert TodoCardModel to map
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'date': date.toIso8601String(),
      'id': id,
      'state': isCompleted ? true : false,
    };
  }
}
