import 'package:flutter/material.dart';
import 'package:skeleton_watcher/ui/shared/app_colors.dart';

class IndicatorButton extends StatelessWidget {
  final double height;
  final String title;
  final Function? onTap;
  final int? indicationCount;
  const IndicatorButton(
      {super.key,
      this.height = 50.0,
      required this.title,
      required this.onTap,
      this.indicationCount});
  bool get hasIndication => indicationCount != null && indicationCount! > 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap as void Function()?,
        child: SizedBox(
          height: height,
          child: Stack(children: [
            Container(
                height: height,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: primaryColor),
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700),
                )),
            hasIndication
                ? Positioned(
                    top: 10,
                    right: 20.0,
                    child: Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: const ShapeDecoration(
                          shape: CircleBorder(), color: darkGrey),
                      child: Text(indicationCount.toString(),
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400)),
                    ),
                  )
                : Container()
          ]),
        ));
  }
}
