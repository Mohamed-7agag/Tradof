import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../company_features/company_profile/data/model/company_model.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../../data/models/project_model.dart';
import '../logic/project_cubit/project_cubit.dart';

class UpcomingProjectItem extends StatelessWidget {
  const UpcomingProjectItem({
    required this.project,
    required this.companyModel,
    super.key,
  });

  final ProjectModel project;
  final CompanyModel companyModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      onTap: () async {
        final result = await context
            .pushNamed(Routes.companyProjectDetailsViewRoute, arguments: {
          'projectModel': project,
          'companyModel': companyModel,
        });
        if (result == true && context.mounted) {
          context.read<ProjectCubit>().getUpcomingProjects();
        }
      },
      child: SlideInLeft(
        from: 400,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          margin: const EdgeInsets.only(bottom: 12),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: AppColors.cardColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               ListTile(
              contentPadding: EdgeInsets.zero,
              horizontalTitleGap: 10,
              leading: CircleAvatar(
                radius: 22,
                backgroundColor: AppColors.cardDarkColor,
                backgroundImage: CachedNetworkImageProvider(
                  project.profileImageUrl ?? '',
                ),
              ),
              title: Text(
                '${project.firstName} ${project.lastName}',
                style: AppStyle.robotoRegular14,
              ),
              subtitle:
                  Text(project.jobTitle, style: AppStyle.robotoRegular12),
              trailing: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: Text(
                  project.status.name,
                  style: AppStyle.robotoRegular8.copyWith(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
              Text(
                project.specialization.name,
                style: AppStyle.robotoRegular12.copyWith(
                  color: AppColors.black,
                ),
              ),
              verticalSpace(8),
              Text(
                project.name,
                style: AppStyle.robotoCondensedMedium15.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              verticalSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildInfoColumn(
                      'Price', '${project.minPrice} - ${project.maxPrice}\$'),
                  const SizedBox(
                    height: 35,
                    child: VerticalDivider(color: AppColors.cardDarkColor),
                  ),
                  _buildInfoColumn('Deadline', '${project.days} Days'),
                  const SizedBox(
                    height: 35,
                    child: VerticalDivider(color: AppColors.cardDarkColor),
                  ),
                  _buildInfoColumn('Offers', '${project.numberOfOffers}'),
                ],
              ),
              verticalSpace(16),

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
          style: AppStyle.robotoCondensedRegular12,
        ),
        verticalSpace(4),
        Text(
          value,
          style: AppStyle.robotoRegular12.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
