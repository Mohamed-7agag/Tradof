import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_style.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../projects/presentation/logic/file_cubit.dart';
import '../../../projects/presentation/widgets/attachment_files_section.dart';
import '../../../projects/presentation/widgets/project_text_field.dart';
import '../widgets/bloc_create_offer_button.dart';
import '../widgets/select_offer_budget.dart';

class CreateOfferView extends StatefulWidget {
  const CreateOfferView({super.key});

  @override
  State<CreateOfferView> createState() => _CreateOfferViewState();
}

class _CreateOfferViewState extends State<CreateOfferView> {
  late final TextEditingController offerDetailsController;
  late final TextEditingController daysController;

  @override
  void initState() {
    super.initState();
    offerDetailsController = TextEditingController();
    daysController = TextEditingController();
  }

  @override
  void dispose() {
    offerDetailsController.dispose();
    daysController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FileCubit(),
      child: Scaffold(
          appBar: _buildAppBAr(),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(25),
                  ProjectTextField(
                    labelText: 'Offer details',
                    controller: offerDetailsController,
                    maxLines: 4,
                  ),
                  verticalSpace(25),
                  ProjectTextField(
                    labelText: 'Delivery Time (Days)',
                    controller: daysController,
                    keyboardType: TextInputType.number,
                  ),
                  verticalSpace(25),
                  SelectOfferBudget(),
                  verticalSpace(35),
                  Text(
                    "Attachments Files",
                    style: AppStyle.poppinsMedium14,
                  ),
                  verticalSpace(12),
                  AttachmentFilesSection(),
                  verticalSpace(60),
                  CreateOfferButton(
                    offerDetailsController: offerDetailsController,
                    daysController: daysController,
                  ),
                  verticalSpace(100),
                ],
              ),
            ),
          )),
    );
  }

  AppBar _buildAppBAr() {
    return AppBar(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
      leadingWidth: 40,
      title: Text(
        'Add Offer',
        style: AppStyle.robotoBold20,
      ),
      actions: [
        SvgPicture.asset(
          'assets/images/pen_add_colored.svg',
          width: 24,
          colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
        ),
        horizontalSpace(16),
      ],
      toolbarHeight: 65,
    );
  }
}
