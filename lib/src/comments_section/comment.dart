// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Comment {
  String author;
  String text;
  DateTime date;
  int id;
  Comment({
    required this.author,
    required this.text,
    required this.date,
    required this.id,
  });

  Comment copyWith({
    String? author,
    String? text,
    DateTime? date,
    int? id,
  }) {
    return Comment(
      author: author ?? this.author,
      text: text ?? this.text,
      date: date ?? this.date,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'author': author,
      'text': text,
      'date': date.millisecondsSinceEpoch,
      'id': id,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      author: map['author'] as String,
      text: map['text'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) =>
      Comment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Comment(author: $author, text: $text, date: $date, id: $id)';
  }

  @override
  bool operator ==(covariant Comment other) {
    if (identical(this, other)) return true;

    return other.author == author &&
        other.text == text &&
        other.date == date &&
        other.id == id;
  }

  @override
  int get hashCode {
    return author.hashCode ^ text.hashCode ^ date.hashCode ^ id.hashCode;
  }
}
