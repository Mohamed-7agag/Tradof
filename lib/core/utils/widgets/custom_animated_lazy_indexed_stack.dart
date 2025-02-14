import 'package:flutter/material.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';

class CustomAnimatedLazyIndexedStack extends StatelessWidget {
  const CustomAnimatedLazyIndexedStack({
    super.key,
    required this.currentIndex,
    required this.children,
  });
  final int currentIndex;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        final offsetAnimation = Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          ),
        );
        return SlideTransition(position: offsetAnimation, child: child);
      },
      child: LazyLoadIndexedStack(
        key: ValueKey<int>(currentIndex),
        index: currentIndex,
        children: children,
      ),
    );
  }
}
