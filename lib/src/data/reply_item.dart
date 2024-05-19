// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:then_he_replied/src/data/comment.dart';

typedef ReplyItemList = List<ReplyItem>;

class ReplyItem {
  String author;
  String text;
  DateTime date;
  String title;
  String context;
  Comment comments;
  int id;
  ReplyItem({
    required this.author,
    required this.text,
    required this.date,
    required this.title,
    required this.context,
    required this.comments,
    required this.id,
  });

  ReplyItem copyWith({
    String? author,
    String? text,
    DateTime? date,
    String? title,
    String? context,
    Comment? comments,
    int? id,
  }) {
    return ReplyItem(
      author: author ?? this.author,
      text: text ?? this.text,
      date: date ?? this.date,
      title: title ?? this.title,
      context: context ?? this.context,
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
      'context': context,
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
      context: map['context'] as String,
      comments: Comment.fromMap(map['comments'] as Map<String, dynamic>),
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReplyItem.fromJson(String source) =>
      ReplyItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ReplyItem(author: $author, text: $text, date: $date, title: $title, context: $context, comments: $comments, id: $id)';
  }

  @override
  bool operator ==(covariant ReplyItem other) {
    if (identical(this, other)) return true;

    return other.author == author &&
        other.text == text &&
        other.date == date &&
        other.title == title &&
        other.context == context &&
        other.comments == comments &&
        other.id == id;
  }

  @override
  int get hashCode {
    return author.hashCode ^
        text.hashCode ^
        date.hashCode ^
        title.hashCode ^
        context.hashCode ^
        comments.hashCode ^
        id.hashCode;
  }
}
