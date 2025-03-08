import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../data/model/offer_model.dart';
import '../widgets/offer_item.dart';

class GetAllOffersView extends StatelessWidget {
  const GetAllOffersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customAppbar(
          title: 'Your Offers',
          actionIcon: HugeIcons.strokeRoundedPenToolAdd,
          titlePadding: 16.w,
        ),
      ],
    );
  }
}
