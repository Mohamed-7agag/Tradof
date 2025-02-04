import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/features/auth/presentation/logic/tables_cubit/tables_cubit.dart';
import 'package:tradof/features/company/profile_company/data/model/company_model.dart';

import '../../../../../core/utils/widgets/custom_button.dart';
import '../../../../auth/data/model/language_model.dart';

class UpdateCompanyProfileTablesButton extends StatelessWidget {
  const UpdateCompanyProfileTablesButton({
    super.key,
    required this.companyModel,
  });
  final CompanyModel companyModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TablesCubit, TablesState>(
      buildWhen: (previous, current) =>
          current.selectedPreferedLanguages !=
              previous.selectedPreferedLanguages ||
          current.selectedIndustriesServed != previous.selectedIndustriesServed,
      builder: (context, state) {
        return CustomButton(
          text: 'Update',
          onPressed: () {
            if (state.selectedPreferedLanguages !=
                companyModel.preferredLanguages) {
              _getDifferenceList(
                context,
                state.selectedPreferedLanguages,
                companyModel.preferredLanguages,
              );
            }
          },
        );
      },
    );
  }

  void _getDifferenceList(BuildContext context, List<LanguageModel> newList,
      List<LanguageModel> oldList) {}
}
