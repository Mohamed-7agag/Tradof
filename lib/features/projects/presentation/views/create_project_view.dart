import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/utils/widgets/custom_button.dart';
import 'package:tradof/features/auth/data/model/language_model.dart';
import 'package:tradof/features/projects/presentation/logic/file_cubit.dart';
import 'package:tradof/features/projects/presentation/widgets/attachment_files_section.dart';
import 'package:tradof/features/projects/presentation/widgets/project_text_field.dart';

import '../../../../core/theming/app_style.dart';
import '../../../auth/presentation/widgets/language_pair_drop_down.dart';
import '../widgets/select_date_section.dart';

class CreateProjectView extends StatelessWidget {
  const CreateProjectView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildCreateProjectAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(20),
              ProjectTextField(
                labelText: 'Project Name',
                controller: TextEditingController(),
              ),
              verticalSpace(22),
              ProjectTextField(
                labelText: 'Project Description',
                controller: TextEditingController(),
                maxLines: 4,
              ),
              verticalSpace(22),
              Text('Language Pair', style: AppStyle.poppinsMedium14),
              verticalSpace(12),
              LanguagePairDropDown(
                hint: 'From Language',
                borderColor: AppColors.grey,
                hintColor: AppColors.darkGrey,
                items: [
                  LanguageModel(id: 0, name: 'English', code: 'EN'),
                  LanguageModel(id: 1, name: 'Arabic', code: 'AR')
                ],
                onChanged: (value) {
                  //fromLanguage = value;
                },
              ),
              verticalSpace(12),
              LanguagePairDropDown(
                hint: 'To Language',
                borderColor: AppColors.grey,
                hintColor: AppColors.darkGrey,
                items: [
                  LanguageModel(id: 0, name: 'English', code: 'EN'),
                  LanguageModel(id: 1, name: 'Arabic', code: 'AR')
                ],
                onChanged: (value) {
                  //toLanguage = value;
                },
              ),
              verticalSpace(40),
              ProjectTextField(
                labelText: 'Minimum Budget',
                controller: TextEditingController(),
                keyboardType: TextInputType.number,
              ),
              verticalSpace(18),
              ProjectTextField(
                labelText: 'Maximum Budget',
                controller: TextEditingController(),
                keyboardType: TextInputType.number,
              ),
              verticalSpace(20),
              Text('Delivery Date', style: AppStyle.poppinsMedium14),
              verticalSpace(12),
              SelectDateSection(),
              verticalSpace(20),
              Text('Attachments Files', style: AppStyle.poppinsMedium14),
              verticalSpace(12),
              BlocProvider(
                create: (context) => FileCubit(),
                child: AttachmentFilesSection(),
              ),
              verticalSpace(60),
              CustomButton(
                text: 'Create Project',
                onPressed: () {},
              ),
              verticalSpace(100),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildCreateProjectAppBar() {
    return AppBar(
      title: Text(
        'Create Project',
        style: AppStyle.robotoBold20.copyWith(color: AppColors.white),
      ),
      backgroundColor: AppColors.primary,
      toolbarHeight: 65,
      actions: [
        SvgPicture.asset('assets/images/create_project.svg'),
        horizontalSpace(16),
      ],
    );
  }
}
