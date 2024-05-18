import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:then_he_replied/src/comments_section/comment.dart';
import 'package:then_he_replied/src/reply_list_screen/reply_item.dart';

part 'reply_list_provider.g.dart';

@riverpod
class ReplyListProvider extends _$ReplyListProvider {
  @override
  Future<List<ReplyItem>> build() async {
    return [
      ReplyItem(
          author: 'Mary',
          text: 'I can\'t believe he said that',
          date: DateTime.now(),
          title: "He said what?",
          comments: Comment(
            author: 'Rebecca',
            text: 'I believe it',
            date: DateTime.now(),
            id: 1,
          ),
          id: 1)
    ];
  }
}
