import 'package:flutter/material.dart';

import 'freelancer_statistic_card.dart';

class CurrentProjectsChart extends StatelessWidget {
  const CurrentProjectsChart({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, index) {
        return const FreelancerStatisticCard();
      },
    );
  }
}
