
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tradof/core/di/di.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';
import 'package:tradof/core/utils/logic/meta_data_cubit/meta_data_cubit.dart';
import 'package:tradof/core/utils/widgets/custom_loading_widget.dart';
import 'package:tradof/features/auth/presentation/logic/freelancer_registeration_cubit.dart';
import 'package:tradof/features/company/profile_company/presentation/logic/company_profile_cubit/company_profile_cubit.dart';
import 'package:tradof/features/company/profile_company/presentation/widgets/build_edit_profile_company_view.dart';

class EditProfileCompanyView extends StatefulWidget {
  const EditProfileCompanyView({
    super.key,
  });

  @override
  State<EditProfileCompanyView> createState() => _EditProfileCompanyViewState();
}

class _EditProfileCompanyViewState extends State<EditProfileCompanyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProfileImageAndCountryCubit(),
          ),
          BlocProvider(
            create: (context) => MetaDataCubit(getIt())..getCountries(),
          ),
          BlocProvider(
            create: (context) =>
                CompanyProfileCubit(getIt())..getCompanyProfile(),
          ),
        ],
        child: BlocBuilder<CompanyProfileCubit, CompanyProfileState>(
          builder: (context, state) {
            if (state.status == CompanyProfileStatus.loading) {
              return const CustomLoadingWidget();
            }
            return BuildEditProfileCompanyView(
              companyModel: state.companyModel!,
            );
          },
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      centerTitle: true,
      title: Text(
        'Personal Info',
        style: AppStyle.robotoBold20.copyWith(color: AppColors.primary),
      ),
      actions: [
        SvgPicture.asset(
          'assets/images/edit.svg',
          colorFilter: const ColorFilter.mode(
            AppColors.primary,
            BlendMode.srcIn,
          ),
        ),
        horizontalSpace(16),
      ],
      toolbarHeight: 65,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
