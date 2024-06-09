import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skeleton_watcher/models/stats.dart';

class FirebaseService {
  final StreamController<Stats> _statsController = StreamController<Stats>();

  FirebaseService() {
    FirebaseFirestore.instance // Get the firebase instance
        .collection('informations') // Get the informations collection
        .doc('project_stats') // Get the project_stats document
        .snapshots() // Get the Stream of DocumentSnapshot
        .listen(_statsUpdated); // Listen to it and conver
  }

  Stream<Stats> get appStats => _statsController.stream;

  void _statsUpdated(DocumentSnapshot snapshot) {
    _statsController.add(Stats.fromSnapshot(snapshot));
  }
}
