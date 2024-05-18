// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:then_he_replied/src/comments_section/comment.dart';

class ReplyItem {
  String author;
  String text;
  DateTime date;
  String title;
  Comment comments;
  int id;
  ReplyItem({
    required this.author,
    required this.text,
    required this.date,
    required this.title,
    required this.comments,
    required this.id,
  });

  ReplyItem copyWith({
    String? author,
    String? text,
    DateTime? date,
    String? title,
    Comment? comments,
    int? id,
  }) {
    return ReplyItem(
      author: author ?? this.author,
      text: text ?? this.text,
      date: date ?? this.date,
      title: title ?? this.title,
      comments: comments ?? this.comments,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'author': author,
      'text': text,
      'date': date.millisecondsSinceEpoch,
      'title': title,
      'comments': comments.toMap(),
      'id': id,
    };
  }

  factory ReplyItem.fromMap(Map<String, dynamic> map) {
    return ReplyItem(
      author: map['author'] as String,
      text: map['text'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      title: map['title'] as String,
      comments: Comment.fromMap(map['comments'] as Map<String, dynamic>),
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReplyItem.fromJson(String source) =>
      ReplyItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ReplyItem(author: $author, text: $text, date: $date, title: $title, comments: $comments, id: $id)';
  }

  @override
  bool operator ==(covariant ReplyItem other) {
    if (identical(this, other)) return true;

    return other.author == author &&
        other.text == text &&
        other.date == date &&
        other.title == title &&
        other.comments == comments &&
        other.id == id;
  }

  @override
  int get hashCode {
    return author.hashCode ^
        text.hashCode ^
        date.hashCode ^
        title.hashCode ^
        comments.hashCode ^
        id.hashCode;
  }
}
