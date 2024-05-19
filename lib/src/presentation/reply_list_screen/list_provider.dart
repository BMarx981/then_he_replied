import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:then_he_replied/src/data/comment.dart';
import 'package:then_he_replied/src/data/reply_item.dart';

final listProvider =
    NotifierProvider<ReplyListNotifier, ReplyItemList>(ReplyListNotifier.new);

class ReplyListNotifier extends Notifier<List<ReplyItem>> {
  @override
  List<ReplyItem> build() {
    return [
      ReplyItem(
          author: 'Mary',
          text: 'I can\'t believe he said that',
          date: DateTime.now(),
          title: "He said what?",
          context: "So I was doing this.",
          comments: Comment(
            author: 'Rebecca',
            text: 'I believe it',
            date: DateTime.now(),
            id: 1,
          ),
          id: 1),
      ReplyItem(
          author: 'Mary',
          text: 'I can\'t believe he said that',
          date: DateTime.now(),
          title: "He said what?",
          context: "So I was doing this.",
          comments: Comment(
            author: 'Rebecca',
            text: 'I believe it',
            date: DateTime.now(),
            id: 2,
          ),
          id: 2),
      ReplyItem(
          author: 'Mary',
          text: 'I can\'t believe he said that',
          date: DateTime.now(),
          title: "He said what?",
          context: "So I was doing this.",
          comments: Comment(
            author: 'Rebecca',
            text: 'I believe it',
            date: DateTime.now(),
            id: 3,
          ),
          id: 3),
    ];
  }

  void addItem(ReplyItem item) {
    state = [...state, item];
  }
}
