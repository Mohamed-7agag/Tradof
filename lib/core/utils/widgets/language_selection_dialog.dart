import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/tables_cubit/tables_cubit.dart';
import '../../helpers/spacing.dart';
import '../../theming/app_colors.dart';
import '../../theming/app_style.dart';
import '../logic/meta_data_cubit/meta_data_cubit.dart';
import '../models/language_model.dart';
import 'custom_failure_widget.dart';
import 'custom_loading_widget.dart';
import 'custom_text_field.dart';

class LanguageSelectionDialog extends StatefulWidget {
  const LanguageSelectionDialog({super.key});

  @override
  State<LanguageSelectionDialog> createState() =>
      _LanguageSelectionDialogState();
}

class _LanguageSelectionDialogState extends State<LanguageSelectionDialog> {
  late final TextEditingController _searchController;
  String _searchQuery = '';

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Select Language',
        style: AppStyle.poppinsBold22.copyWith(color: Colors.white),
      ),
      backgroundColor: AppColors.darkGrey,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(14)),
      ),
      content: SizedBox(
        width: 1.sw,
        height: 0.7.sh,
        child: Column(
          children: [
            CustomTextField(
              labelText: 'Search...',
              controller: _searchController,
              outlineBorder: true,
              labelColor: AppColors.white,
              onChange: (value) {
                setState(() => _searchQuery = value);
              },
            ),
            verticalSpace(16),
            Expanded(
              child: BlocBuilder<MetaDataCubit, MetaDataState>(
                buildWhen: (previous, current) =>
                    previous.languages != current.languages,
                builder: (context, state) {
                  if (state.status.isLoading) {
                    return const CustomLoadingWidget(color: AppColors.white);
                  } else if (state.status.isError) {
                    return CustomFailureWidget(
                      text: state.errorMessage,
                      textColor: AppColors.white,
                    );
                  }

                  final filteredLanguages = state.languages.where((language) {
                    return language.languageName
                        .toLowerCase()
                        .contains(_searchQuery.toLowerCase());
                  }).toList();

                  return LanguagesListView(
                    filteredLanguages: filteredLanguages,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LanguagesListView extends StatelessWidget {
  const LanguagesListView({
    required this.filteredLanguages,
    super.key,
  });

  final List<LanguageModel> filteredLanguages;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: filteredLanguages.length,
      separatorBuilder: (BuildContext context, int index) =>
          const Divider(color: Colors.white10, height: 0),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          contentPadding: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          title: Text(
            '${filteredLanguages[index].languageName} (${filteredLanguages[index].countryName})',
            style: AppStyle.robotoRegular15.copyWith(color: Colors.white),
          ),
          onTap: () {
            context.read<TablesCubit>().addPreferedLanguage(
                  filteredLanguages[index],
                );
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
