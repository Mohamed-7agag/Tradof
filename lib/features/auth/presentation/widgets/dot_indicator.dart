import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    required this.currentPage,
    required this.activeColor,
    required this.inActiveColor,
    super.key,
  });
  final int currentPage;
  final Color activeColor, inActiveColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 32,
          height: 4,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: currentPage == index ? activeColor : inActiveColor,
          ),
        );
      }),
    );
  }
}
