import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/features/auth/data/model/language_model.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/utils/logic/meta_data_cubit/meta_data_cubit.dart';
import '../../../../core/utils/widgets/custom_toastification.dart';
import '../../data/model/language_pair_model.dart';
import '../logic/tables_cubit/tables_cubit.dart';
import 'language_drop_down.dart';

showLanguagePairDialog(BuildContext context) {
  final cubit = context.read<TablesCubit>();
  LanguageModel? fromLanguage, toLanguage;
  List<LanguageModel> languages = context.read<MetaDataCubit>().state.languages;
  AwesomeDialog(
    context: context,
    dialogType: DialogType.noHeader,
    animType: AnimType.rightSlide,
    title: 'Language Pair',
    dialogBorderRadius: BorderRadius.circular(12),
    body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          LanguageDropDown(
            hint: 'From',
            items: languages,
            onChanged: (value) {
              fromLanguage = value;
            },
          ),
          verticalSpace(12),
          LanguageDropDown(
            hint: 'To',
            items: languages,
            onChanged: (value) {
              toLanguage = value;
            },
          ),
        ],
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
      cubit.addLanguagePair(
        LanguagePairModel(
          fromLanguage: fromLanguage!,
          toLanguage: toLanguage!,
        ),
      );
    },
    btnCancelOnPress: () {},
  ).show();
}
