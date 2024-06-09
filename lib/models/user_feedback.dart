class UserFeedback {
  final String details;
  final String note;
  final bool open;
  final bool read;
  final String title;
  final int type;
  final String userId;
  UserFeedback(
      {required this.details,
      required this.note,
      required this.open,
      required this.read,
      required this.title,
      required this.type,
      required this.userId});
  UserFeedback.fromData(Map<String, dynamic> data)
      : details = data['details'],
        note = data['note'],
        open = data['open'] ?? true,
        read = data['read'] ?? false,
        title = data['title'],
        type = data['type'] ?? 0,
        userId = data['userId'];
}
