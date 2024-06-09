import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  FirebaseService() {
    FirebaseFirestore.instance // Get the firebase instance
        .collection('informations') // Get the informations collection
        .doc('project_stats') // Get the project_stats document
        .snapshots() // Get the Stream of DocumentSnapshot
        .listen(_statsUpdated); // Listen to it and conver
  }
}
