import 'package:flutter/material.dart';
import 'package:tradof/core/helpers/spacing.dart';

class AllProjectsSection extends StatelessWidget {
  const AllProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          verticalSpace(50),
          CircleAvatar(radius: 30),
          CircleAvatar(radius: 30),
        ],
      ),
    );
  }
}
