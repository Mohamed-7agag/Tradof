// import 'package:flutter/material.dart';

// import '../../../../projects/data/models/statistics_project_model.dart';
// import 'freelancer_statistic_card.dart';

// class CurrentProjectsChart extends StatelessWidget {
//   const CurrentProjectsChart({required this.statistics, super.key});

//   final StatisticsProjectModel statistics;

//   @override
//   Widget build(BuildContext context) {
//     final totalProjects =
//         statistics.active + statistics.inProgress + statistics.accepted;
//     return ListView(
//       scrollDirection: Axis.horizontal,
//       children: [
//         FreelancerStatisticCard(
//           projects: statistics.accepted,
//           totalProjects: totalProjects,
//           title: "Accepted\nProjects",
//         ),
//         FreelancerStatisticCard(
//           projects: statistics.active,
//           totalProjects:
//               statistics.active + statistics.inProgress + statistics.accepted,
//           title: "Completed\nProjects",
//         ),
//         FreelancerStatisticCard(
//           projects: statistics.inProgress,
//           totalProjects:
//               statistics.active + statistics.inProgress + statistics.accepted,
//           title: "Uncompleted\nProjects",
//         ),
//       ],
//     );
//   }
// }
