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
    ];
  }

  void addItem(ReplyItem item) {
    state = [...state, item];
  }

  void removeItem(int id) {
    final ls = state;
    for (final item in ls) {
      if (item.id == id) {
        ls.remove(item);
      }
    }
    state = ls;
  }
}
