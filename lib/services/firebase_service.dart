import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skeleton_watcher/models/stats.dart';
import 'package:skeleton_watcher/models/user_feedback.dart';

class FirebaseService {
  final StreamController<Stats> _statsController = StreamController<Stats>();

  // Controller for our feedback data stream
  final StreamController<List<UserFeedback>> _feedbackController =
      StreamController<List<UserFeedback>>();

  final StreamController<int> _unreadController = StreamController<int>();

  FirebaseService() {
    FirebaseFirestore.instance // Get the firebase instance
        .collection('informations') // Get the informations collection
        .doc('project_stats') // Get the project_stats document
        .snapshots() // Get the Stream of DocumentSnapshot
        .listen(_statsUpdated); // Listen to it and conver

    FirebaseFirestore.instance
        .collection('feedback')
        .where("open", isEqualTo: true)
        .snapshots()
        .listen(_feedbackAdded);
  }

  Stream<Stats> get appStats => _statsController.stream;

  // Public feedback stream to be consumed in the model
  Stream<List<UserFeedback>> get feedback => _feedbackController.stream;

  Stream<int> get unreadCount => _unreadController.stream;

  void _statsUpdated(DocumentSnapshot snapshot) {
    _statsController.add(Stats.fromSnapshot(snapshot));
  }

  // Converts the snapshot into a list of UserFeedback items and places on stream
  void _feedbackAdded(QuerySnapshot snapShot) {
    var feedback = _getFeedbackFromSnapshot(snapShot);
    _feedbackController.add(feedback);
    _emitUnreadCount(feedback);
  }

  // Helper function that Converts a QuerySnapshot into a List<UserFeedback>
  List<UserFeedback> _getFeedbackFromSnapshot(QuerySnapshot snapShot) {
    var feedbackItems = List<UserFeedback>.empty(growable: true);
    var documents = snapShot.docs;
    var hasDocuments = documents.isNotEmpty;
    if (hasDocuments) {
      for (var document in documents) {
        feedbackItems.add(
            UserFeedback.fromData(document.data() as Map<String, dynamic>));
      }
    }
    return feedbackItems;
  }

  void _emitUnreadCount(List<UserFeedback> userFeedback) {
    var unreadCount =
        userFeedback.where((feedbackItem) => !feedbackItem.read).length;
    _unreadController.add(unreadCount);
  }
}
