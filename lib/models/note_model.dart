class NoteCardModel {
  final String title;
  final String content;
  final DateTime date;
  final int id;
  final bool isCompleted; 

  NoteCardModel({
    required this.title,
    required this.content,
    required this.date,
    required this.id,
    required this.isCompleted,
  });

  // Factory method to create NoteCardModel from map
  factory NoteCardModel.fromMap(Map<String, dynamic> map) {
    return NoteCardModel(
      title: map['title'],
      content: map['content'],
      date: DateTime.parse(map['date']),
      id: map['id'],
      isCompleted: map['state'] == 1, // Map database state to isCompleted
    );
  }

  // Method to convert NoteCardModel to map
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'date': date.toIso8601String(),
      'id': id,
      'state': isCompleted ? 1 : 0, // Map isCompleted to database state
    };
  }
}
