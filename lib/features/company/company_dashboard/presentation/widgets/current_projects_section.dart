import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../freelancer/dashbord/presentation/widgets/charts_completed.dart';

class CurrentProjectsSection extends StatelessWidget {
  const CurrentProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(50),
        Expanded(
          flex: 2,
          child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 10, right: 2),
            itemBuilder: (context, index) {
              return CompleteProjectsCard();
            },
          ),
        ),
        verticalSpace(10),
        Expanded(
          flex: 7,
          child: Container(width: 1.sw),
        ),
      ],
    );
  }
}
