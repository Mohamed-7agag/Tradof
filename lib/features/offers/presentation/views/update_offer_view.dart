import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_style.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../projects/presentation/logic/file_cubit.dart';
import '../../../projects/presentation/widgets/attachment_files_section.dart';
import '../../../projects/presentation/widgets/project_text_field.dart';
import '../../data/model/offer_model.dart';
import '../widgets/offer_header_section.dart';
import '../widgets/select_offer_budget.dart';
import '../widgets/update_offer_button.dart';

class UpdateOfferView extends StatefulWidget {
  const UpdateOfferView({required this.offer, super.key});

  final OfferModel offer;

  @override
  State<UpdateOfferView> createState() => _UpdateOfferViewState();
}

class _UpdateOfferViewState extends State<UpdateOfferView> {
  late final TextEditingController offerDetailsController;
  late final TextEditingController daysController;

  @override
  void initState() {
    super.initState();
    offerDetailsController =
        TextEditingController(text: widget.offer.proposalDescription);
    daysController = TextEditingController(text: widget.offer.days.toString());
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
            title: 'Update Offer',
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
                      verticalSpace(16),
                      // OfferHeaderSection(
                      //   offerId: widget.offer.id,
                      // ),
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
                        initialPrice: widget.offer.offerPrice,
                        maxPrice: widget.offer.projectMaxPrice + 10000,
                        minPrice: 0,
                      ),
                      verticalSpace(35),
                      Text(
                        "Attachments Files",
                        style: AppStyle.poppinsMedium14,
                      ),
                      verticalSpace(12),
                      const AttachmentFilesSection(),
                      Expanded(child: verticalSpace(40)),
                      UpdateOfferButton(
                        offerDetailsController: offerDetailsController,
                        daysController: daysController,
                        projectId: widget.offer.projectId,
                        offerId: widget.offer.id,
                      ),
                      verticalSpace(20),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
