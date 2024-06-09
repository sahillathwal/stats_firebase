import 'package:flutter/material.dart';
import 'package:skeleton_watcher/scoped_models/feedback_view_model.dart';
import 'package:skeleton_watcher/ui/shared/font_styles.dart';
import 'package:skeleton_watcher/ui/shared/ui_reducers.dart';
import 'package:skeleton_watcher/ui/views/base_view.dart';
import 'package:skeleton_watcher/ui/widgets/feedback_item.dart';
import 'package:skeleton_watcher/ui/widgets/watcher_toolbar.dart';

class FeedbackView extends StatelessWidget {
  const FeedbackView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<FeedbackViewModel>(
        builder: (context, childe, model) => Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: Column(
              children: <Widget>[
                const WatcherToolbar(title: 'FEEDBACK', showBackButton: true),
                SizedBox(
                    height: screenHeight(context, decreasedBy: toolbarHeight),
                    child: _getBodyUi(context, model)),
              ],
            )));
  }

  Widget _getBodyUi(BuildContext context, FeedbackViewModel model) {
    switch (model.state) {
      case ViewState.busy:
        return _getLoadingUi(context);
      case ViewState.noDataAvailable:
        return _noDataUi(context, model);
      case ViewState.error:
        return _errorUi(context, model);
      case ViewState.dataFetched:
      default:
        return _getListUi(model);
    }
  }

  Widget _getListUi(FeedbackViewModel model) {
    if (model.userFeedback == null) {
      return ListView(); // Or some other widget
    }

    return ListView.builder(
        itemCount: model.userFeedback!.length,
        itemBuilder: (context, itemIndex) {
          var feedbackItem = model.userFeedback![itemIndex];
          return FeedbackItem(feedbackItem: feedbackItem);
        });
  }

  Widget _getLoadingUi(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CircularProgressIndicator(
            valueColor:
                AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)),
        const Text('Fetching data ...')
      ],
    ));
  }

  Widget _noDataUi(BuildContext context, FeedbackViewModel model) {
    return _getCenteredViewMessage(context, "No data available yet", model);
  }

  Widget _errorUi(BuildContext context, FeedbackViewModel model) {
    return _getCenteredViewMessage(
        context, "Error retrieving your data. Tap to try again", model,
        error: true);
  }

  Widget _getCenteredViewMessage(
      BuildContext context, String message, FeedbackViewModel model,
      {bool error = false}) {
    return Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  message,
                  style: viewErrorTitle,
                  textAlign: TextAlign.center,
                ),
                error
                    ? const Icon(
                        // WWrap in gesture detector and call you refresh future here
                        Icons.refresh,
                        color: Colors.white,
                        size: 45.0,
                      )
                    : Container()
              ],
            )));
  }
}
