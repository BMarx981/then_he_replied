import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:then_he_replied/src/data/reply_item.dart';

class FirestoreService {
  final CollectionReference replies =
      FirebaseFirestore.instance.collection('replies');

  //Create a reply
  Future<void> addReply(ReplyItem item) {
    return replies.add({
      'author': item.author,
      'context': item.context,
      'date': item.date,
      'id': item.id,
      'text': item.text,
      'title': item.title,
    });
  }

  //Read all replies
  Stream<QuerySnapshot> getReplies() {
    final replyStream = replies.orderBy('author', descending: true).snapshots();
    return replyStream;
  }

  //Update a reply
  Future<void> updateAReply(String docId, ReplyItem item) {
    return replies.doc(docId).update({
      'author': item.author,
      'context': item.context,
      'date': item.date,
      'id': item.id,
      'text': item.text,
      'title': item.title,
    });
  }

  //delete a reply
  Future<void> deleteReply(String docId) {
    return replies.doc(docId).delete();
  }
}
