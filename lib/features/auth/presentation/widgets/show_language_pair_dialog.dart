import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/widgets/custom_drop_down_widget.dart';
import '../../../../core/utils/widgets/custom_toastification.dart';
import '../../data/model/language_model.dart';
import '../logic/tables_cubit/tables_cubit.dart';

showLanguagePairDialog(BuildContext context) {
  final cubit = context.read<TablesCubit>();
  String? fromLanguage, toLanguage;
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
          CustomDropDownWidget(
            hint: 'From',
            items: availableLanguages,
            onChanged: (value) {
              fromLanguage = value;
            },
          ),
          verticalSpace(12),
          CustomDropDownWidget(
            hint: 'To',
            items: availableLanguages,
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
        errorToast(context, 'Error', 'You should use two languages');
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
        LanguageModel(
          languageName: '$fromLanguage-$toLanguage',
          tag: '${availableTags[fromLanguage]}-${availableTags[toLanguage]}',
        ),
      );
    },
    btnCancelOnPress: () {},
  ).show();
}
