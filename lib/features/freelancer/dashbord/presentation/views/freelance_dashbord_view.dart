import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/features/freelancer/dashbord/presentation/widgets/charts_completed.dart';
import 'package:tradof/features/freelancer/dashbord/presentation/widgets/dashbord_container_curve.dart';

class FreelanceDashbordView extends StatelessWidget {
  const FreelanceDashbordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DashbordContainerCurve(),
          verticalSpace(11),
          SizedBox(
            height: 123.h,
            child: ListView.builder(
              itemCount: 3,
              physics: AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CompleteProjectsCard(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
