import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    required this.currentPage,
    required this.activeColor,
    required this.inActiveColor,
  });
  final int currentPage;
  final Color activeColor, inActiveColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 4),
          width: 32,
          height: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: currentPage == index ? activeColor : inActiveColor,
          ),
        );
      }),
    );
  }
}
