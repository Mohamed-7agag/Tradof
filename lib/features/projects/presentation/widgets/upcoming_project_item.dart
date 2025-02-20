import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../../../auth/data/model/specialization_model.dart';
import '../../../company/company_profile/data/model/company_model.dart';
import '../../data/models/project_model.dart';
import '../logic/project_cubit/project_cubit.dart';

class UpcomingProjectItem extends StatefulWidget {
  const UpcomingProjectItem({
    required this.project,
    required this.companyModel,
    super.key,
  });

  final ProjectModel project;
  final CompanyModel companyModel;

  @override
  State<UpcomingProjectItem> createState() => _UpcomingProjectItemState();
}

class _UpcomingProjectItemState extends State<UpcomingProjectItem> {
  SpecializationModel getSpecialization() {
    return widget.companyModel.specializations.firstWhere(
      (element) => element.id == widget.project.specializationId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final result =
            await context.pushNamed(Routes.projectDetailsViewRoute, arguments: {
          'projectModel': widget.project,
          'companyModel': widget.companyModel,
          'specialization': getSpecialization(),
        });
        if (result == true && context.mounted) {
          context.read<ProjectCubit>().getUpcomingProjects();
        }
      },
      child: SlideInLeft(
        from: 400,
        child: Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.cardColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    getSpecialization().name,
                    style: AppStyle.robotoRegular12.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Active',
                      style: AppStyle.robotoRegular10.copyWith(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpace(8),
              Text(
                widget.project.name,
                style: AppStyle.robotoCondensedMedium15.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              verticalSpace(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildInfoColumn('Price',
                      '${widget.project.minPrice} - ${widget.project.maxPrice}\$'),
                  const SizedBox(
                    height: 35,
                    child: VerticalDivider(color: AppColors.cardDarkColor),
                  ),
                  _buildInfoColumn('Deadline', '${widget.project.days} Days'),
                  const SizedBox(
                    height: 35,
                    child: VerticalDivider(color: AppColors.cardDarkColor),
                  ),
                  _buildInfoColumn(
                      'Offers', '${widget.project.numberOfOffers}'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoColumn(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: AppStyle.robotoCondensedBold14.copyWith(
            color: AppColors.black,
          ),
        ),
        verticalSpace(4),
        Text(
          value,
          style: AppStyle.robotoRegular12
              .copyWith(color: AppColors.primary, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
