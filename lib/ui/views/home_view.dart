import 'package:flutter/material.dart';
import 'package:skeleton_watcher/scoped_models/home_view_model.dart';
import 'package:skeleton_watcher/ui/views/base_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
        builder: (context, child, model) => Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: Container(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: Container())));
  }
}
