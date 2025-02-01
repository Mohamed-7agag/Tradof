import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/di/di.dart';
import 'package:tradof/core/helpers/extensions.dart';
import 'package:tradof/core/routing/routes.dart';
import 'package:tradof/core/utils/logic/meta_data_cubit/meta_data_cubit.dart';
import 'package:tradof/features/projects/presentation/logic/project_cubit/project_cubit.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../core/utils/widgets/custom_toastification.dart';
import '../../../auth/presentation/widgets/language_pair_drop_down.dart';

class CreateProjectLanguagePair extends StatelessWidget {
  const CreateProjectLanguagePair({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MetaDataCubit(getIt())..getLanguages(),
      child: BlocConsumer<MetaDataCubit, MetaDataState>(
        listener: (context, state) {
          if (state.status.isError) {
            context.goNamed(Routes.companyBottomNavBarViewRoute, extra: 0);
            errorToast(context, 'Error', state.errorMessage);
          }
        },
        builder: (context, state) {
          return state.status.isLoading
              ? const CustomLoadingWidget()
              : Column(
                  children: [
                    LanguagePairDropDown(
                      hint: 'From Language',
                      borderColor: AppColors.grey,
                      hintColor: AppColors.darkGrey,
                      items: state.languages,
                      onChanged: (value) {
                        context
                            .read<ProjectCubit>()
                            .setLanguagePair(fromLanguage: value);
                      },
                    ),
                    verticalSpace(12),
                    LanguagePairDropDown(
                      hint: 'To Language',
                      borderColor: AppColors.grey,
                      hintColor: AppColors.darkGrey,
                      items: state.languages,
                      onChanged: (value) {
                        context
                            .read<ProjectCubit>()
                            .setLanguagePair(toLanguage: value);
                      },
                    ),
                  ],
                );
        },
      ),
    );
  }
}
