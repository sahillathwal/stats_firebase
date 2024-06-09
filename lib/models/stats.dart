import 'package:cloud_firestore/cloud_firestore.dart';

/// Represents the stats from the Firebase service
class Stats {
  final int userCount;
  final int appCount;
  final int errorCount;
  Stats(
      {required this.userCount,
      required this.appCount,
      required this.errorCount});

  Stats.fromSnapshot(DocumentSnapshot snapShot)
      : appCount = snapShot['appCount'] ?? 0,
        userCount = snapShot['userCount'] ?? 0,
        errorCount = snapShot['errorCount'] ?? 0;
}
