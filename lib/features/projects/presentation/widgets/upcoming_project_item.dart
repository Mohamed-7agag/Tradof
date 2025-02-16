import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_style.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../company/company_profile/data/model/company_model.dart';
import '../../data/models/project_model.dart';

class UpcomingProjectItem extends StatefulWidget {
  const UpcomingProjectItem({
    super.key,
    required this.project,
    required this.companyModel,
  });
  final ProjectModel project;
  final CompanyModel companyModel;

  @override
  State<UpcomingProjectItem> createState() => _UpcomingProjectItemState();
}

class _UpcomingProjectItemState extends State<UpcomingProjectItem> {
  String getSpecialization() {
    String specialization = widget.companyModel.specializations
        .firstWhere((element) => element.id == widget.project.specializationId)
        .name;
    return specialization;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      margin: EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: AppColors.cardColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              getSpecialization(),
              style: AppStyle.robotoRegular14,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'status: ',
                    style: AppStyle.robotoRegular10
                        .copyWith(color: AppColors.black),
                  ),
                  TextSpan(
                    text: 'Active',
                    style: AppStyle.robotoRegular10.copyWith(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            trailing: InkWell(
              onTap: () {},
              child: HugeIcon(
                icon: HugeIcons.strokeRoundedCancel02,
                color: Colors.red,
              ),
            ),
          ),
          Text(
            widget.project.name,
            style: AppStyle.robotoCondensedMedium15,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          verticalSpace(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text('Price', style: AppStyle.robotoCondensedBold14),
                  verticalSpace(4),
                  Text(
                      '${widget.project.minPrice} - ${widget.project.maxPrice}\$',
                      style: AppStyle.robotoCondensedMedium12),
                ],
              ),
              Column(
                children: [
                  Text('Deadline', style: AppStyle.robotoCondensedBold14),
                  verticalSpace(4),
                  Text('${widget.project.days} Days',
                      style: AppStyle.robotoCondensedMedium12),
                ],
              ),
              Column(
                children: [
                  Text('Offers', style: AppStyle.robotoCondensedBold14),
                  verticalSpace(4),
                  Text('${widget.project.numberOfOffers}',
                      style: AppStyle.robotoCondensedMedium12),
                ],
              ),
            ],
          ),
          verticalSpace(14),
        ],
      ),
    );
  }
}
