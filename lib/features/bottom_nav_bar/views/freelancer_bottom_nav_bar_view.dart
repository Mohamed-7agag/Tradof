// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';

import '../../../core/helpers/exit_dialog.dart';
import '../../../core/utils/logic/meta_data_cubit/meta_data_cubit.dart';
import '../../../core/utils/widgets/custom_failure_widget.dart';
import '../../../core/utils/widgets/custom_loading_widget.dart';
import '../../dashboard/freelancer_dashboard/presentation/views/freelance_dashbord_view.dart';
import '../../offers/presentation/views/get_all_offers_view.dart';
import '../../profile/freelancer_profile/presentation/logic/freelancer_profile_cubit/freelancer_profile_cubit.dart';
import '../../profile/freelancer_profile/presentation/views/freelancer_profile_view.dart';
import '../../settings/freelancer_setting/presentation/views/freelancer_setting_view.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class FreelancerBottomNavBarView extends StatefulWidget {
  const FreelancerBottomNavBarView({super.key});

  @override
  State<FreelancerBottomNavBarView> createState() =>
      _FreelancerBottomNavBarViewState();
}

class _FreelancerBottomNavBarViewState
    extends State<FreelancerBottomNavBarView> {
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    if (!context.read<MetaDataCubit>().state.status.isFetchAllMetaDataSuccess) {
      context.read<MetaDataCubit>().fetchAllMetaData();
    }
  }

  List<Widget> _buildIndexedStackChildren(FreelancerProfileState state) {
    return [
      FreelancerDashboardView(freelancerModel: state.freelancerModel!),
      GetAllOffersView(),
      FreelancerProfileView(freelancerModel: state.freelancerModel!),
      FreelancerDashboardView(freelancerModel: state.freelancerModel!),
      FreelancerSettingView(freelancerModel: state.freelancerModel!),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => exitDialog(context),
      child: Scaffold(
        body: BlocBuilder<FreelancerProfileCubit, FreelancerProfileState>(
          buildWhen: (previous, current) => _buildWhen(current),
          builder: (context, state) {
            if (state.status.isGetFreelancerSuccess) {
              return LazyLoadIndexedStack(
                index: currentIndex,
                children: _buildIndexedStackChildren(state),
              );
            } else if (state.status.isGetFreelancerFailure) {
              return CustomFailureWidget(
                text: state.errMessage,
                onRetry: () async {
                  context.read<FreelancerProfileCubit>().getFreelancerProfile();
                },
              );
            }
            return const CustomLoadingWidget();
          },
        ),
        bottomNavigationBar: CustomBottomNavBar(
          isFreelancer: true,
          onTabTapped: (index) {
            setState(() => currentIndex = index);
          },
        ),
      ),
    );
  }
}

bool _buildWhen(FreelancerProfileState current) {
  return current.status.isGetFreelancerFailure ||
      current.status.isGetFreelancerSuccess ||
      current.status.isGetFreelancerLoading;
}
