import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_style.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../projects/data/models/project_model.dart';
import '../../../projects/presentation/logic/file_cubit.dart';
import '../../../projects/presentation/widgets/attachment_files_section.dart';
import '../../../projects/presentation/widgets/project_text_field.dart';
import '../widgets/add_offer_button.dart';
import '../widgets/select_offer_budget.dart';

class AddOfferView extends StatefulWidget {
  const AddOfferView({required this.project, super.key});
  final ProjectModel project;
  @override
  State<AddOfferView> createState() => _AddOfferViewState();
}

class _AddOfferViewState extends State<AddOfferView> {
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
          appBar: customAppbar(
            title: 'Add Offer',
            actionIcon: HugeIcons.strokeRoundedPenToolAdd,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
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
                      SelectOfferBudget(
                        maxPrice: widget.project.maxPrice.toDouble(),
                        minPrice: 0.0,
                      ),
                      verticalSpace(35),
                      Text(
                        "Attachments Files",
                        style: AppStyle.poppinsMedium14,
                      ),
                      verticalSpace(12),
                      const AttachmentFilesSection(),
                      Expanded(child: verticalSpace(40)),
                      AddOfferButton(
                        projectId: widget.project.id,
                        offerDetailsController: offerDetailsController,
                        daysController: daysController,
                      ),
                      verticalSpace(20),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
