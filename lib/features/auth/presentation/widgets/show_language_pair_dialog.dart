import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/utils/models/language_model.dart';
import 'package:tradof/core/utils/widgets/custom_failure_widget.dart';
import 'package:tradof/core/utils/widgets/custom_loading_widget.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/utils/logic/meta_data_cubit/meta_data_cubit.dart';
import '../../../../core/utils/models/language_pair_model.dart';
import '../../../../core/utils/widgets/custom_toastification.dart';
import '../logic/tables_cubit/tables_cubit.dart';
import 'language_drop_down.dart';

showLanguagePairDialog(BuildContext context) {
  final tablesCubit = context.read<TablesCubit>();
  final metaDataCubit = context.read<MetaDataCubit>();
  LanguageModel? fromLanguage, toLanguage;
  AwesomeDialog(
    context: context,
    dialogType: DialogType.noHeader,
    animType: AnimType.rightSlide,
    title: 'Language Pair',
    dialogBorderRadius: BorderRadius.circular(12),
    body: BlocProvider.value(
      value: metaDataCubit..getLanguages(),
      child: BlocBuilder<MetaDataCubit, MetaDataState>(
        builder: (context, state) {
          if (state.status.isGetLanguages) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                children: [
                  LanguageDropDown(
                    hint: 'From',
                    items: state.languages,
                    onChanged: (value) {
                      fromLanguage = value;
                    },
                  ),
                  verticalSpace(12),
                  LanguageDropDown(
                    hint: 'To',
                    items: state.languages,
                    onChanged: (value) {
                      toLanguage = value;
                    },
                  ),
                ],
              ),
            );
          } else if (state.status.isError) {
            return CustomFailureWidget(
              text: state.errorMessage,
              textColor: AppColors.white,
            );
          }
          return CustomLoadingWidget(
            color: AppColors.white,
          );
        },
      ),
    ),
    padding: EdgeInsets.symmetric(horizontal: 14),
    dialogBackgroundColor: AppColors.darkGrey,
    btnOkText: 'Add',
    btnOkOnPress: () {
      if (fromLanguage == null || toLanguage == null) {
        errorToast(
          context,
          'Error',
          'You should use at least one Language Pair',
        );
        return;
      }
      if (fromLanguage == toLanguage) {
        errorToast(
          context,
          'Error',
          'You should use two different languages',
        );
        return;
      }
      tablesCubit.addLanguagePair(
        LanguagePairModel(
          fromLanguage: fromLanguage!,
          toLanguage: toLanguage!,
        ),
      );
    },
    btnCancelOnPress: () {},
  ).show();
}
