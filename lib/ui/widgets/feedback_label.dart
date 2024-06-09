import 'package:flutter/material.dart';

enum LabelType { bug, request, general }

class FeedbackLabel extends StatelessWidget {
  final int type;
  const FeedbackLabel({super.key, required this.type});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.0),
            color: _getLabelColor(_getTypeForType())),
        child: Text(_getLabelName()));
  }

  String _getLabelName() {
    return _getTypeForType().toString().split('.').last;
  }

  LabelType _getTypeForType() {
    switch (type) {
      case 0:
        return LabelType.bug;
      case 1:
        return LabelType.request;
      case 2:
        return LabelType.general;
    }
    return LabelType.bug;
  }

  Color? _getLabelColor(LabelType label) {
    switch (label) {
      case LabelType.bug:
        return const Color.fromARGB(255, 202, 9, 9);
      case LabelType.request:
        return const Color.fromARGB(255, 9, 71, 202);
      case LabelType.general:
        return const Color.fromARGB(255, 202, 134, 9);
    }
  }
}
