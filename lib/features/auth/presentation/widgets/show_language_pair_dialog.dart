import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/helpers/extensions.dart';
import 'package:tradof/core/theming/app_style.dart';
import 'package:tradof/features/auth/data/model/language_model.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/utils/logic/meta_data_cubit/meta_data_cubit.dart';
import '../../../../core/utils/widgets/custom_toastification.dart';
import '../../data/model/language_pair_model.dart';
import '../logic/tables_cubit/tables_cubit.dart';
import 'language_pair_drop_down.dart';

showLanguagePairDialog(BuildContext context) {
  final cubit = context.read<TablesCubit>();
  LanguageModel? fromLanguage, toLanguage;
  List<LanguageModel> languages = context.read<MetaDataCubit>().state.languages;
  languages.isNullOrEmpty()
      ? AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          title: 'Error',
          desc: 'There is an error happened,\nplease try again later',
          dialogBackgroundColor: AppColors.darkGrey,
          titleTextStyle:
              AppStyle.robotoBold20.copyWith(color: AppColors.white),
          descTextStyle:
              AppStyle.robotoRegular14.copyWith(color: AppColors.white),
          btnOkOnPress: () {},
        ).show()
      : AwesomeDialog(
          context: context,
          dialogType: DialogType.noHeader,
          animType: AnimType.rightSlide,
          title: 'Language Pair',
          dialogBorderRadius: BorderRadius.circular(12),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              children: [
                LanguagePairDropDown(
                  hint: 'From',
                  items: languages,
                  onChanged: (value) {
                    fromLanguage = value;
                  },
                ),
                verticalSpace(12),
                LanguagePairDropDown(
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
              errorToast(context, 'Error',
                  'You should use at least one Language Pair');
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
