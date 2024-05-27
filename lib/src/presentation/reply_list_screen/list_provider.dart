import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:then_he_replied/src/data/comment.dart';
import 'package:then_he_replied/src/data/reply_item.dart';
import 'package:then_he_replied/src/services/firestore_service.dart';

final listProvider =
    NotifierProvider<ReplyListNotifier, ReplyItemList>(ReplyListNotifier.new);

class ReplyListNotifier extends Notifier<List<ReplyItem>> {
  final fire = FirestoreService();
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

  Stream<QuerySnapshot> getReplies() {
    final list = fire.getReplies();

    return list;
  }

  Future<void> updateItem(int id, ReplyItem item) async {
    await fire.updateAReply(id.toString(), item);
  }

  Future<void> addItem(ReplyItem item) async {
    await fire.addReply(item);
    state = [...state, item];
  }

  Future<void> removeItem(int id) async {
    await fire.deleteReply(id.toString());
    final ls = state;
    for (final item in ls) {
      if (item.id == id) {
        ls.remove(item);
      }
    }
    state = ls;
  }
}
