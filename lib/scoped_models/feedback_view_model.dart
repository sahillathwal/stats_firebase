import 'package:skeleton_watcher/models/user_feedback.dart';
import 'package:skeleton_watcher/service_locator.dart';
import 'package:skeleton_watcher/services/firebase_service.dart';
import 'base_model.dart';

export 'package:skeleton_watcher/enums/view_state.dart';

/// Contains logic for a list view with the general expected functionality.
class FeedbackViewModel extends BaseModel {
  final FirebaseService _firebaseService = locator<FirebaseService>();
  List<UserFeedback>? userFeedback;
  FeedbackViewModel() {
    _firebaseService.feedback.listen(_onFeedbackUpdated);
  }
  void _onFeedbackUpdated(List<UserFeedback> feedback) {
    userFeedback = feedback;
    if (userFeedback == null) {
      setState(ViewState.busy);
    } else {
      setState(userFeedback!.isEmpty
          ? ViewState.noDataAvailable
          : ViewState.dataFetched);
    }
  }
}
