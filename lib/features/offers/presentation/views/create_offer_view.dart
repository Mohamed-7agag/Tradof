import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_style.dart';
import 'package:tradof/features/offers/presentation/logic/cubit/offer_cubit.dart';
import 'package:tradof/features/offers/presentation/widgets/bloc_create_offer_button.dart';
import 'package:tradof/features/offers/presentation/widgets/delivery_time_section.dart';
import 'package:tradof/features/offers/presentation/widgets/select_offer_budget.dart';
import 'package:tradof/features/projects/presentation/logic/file_cubit.dart';
import 'package:tradof/features/projects/presentation/widgets/attachment_files_section.dart';
import 'package:tradof/features/projects/presentation/widgets/project_text_field.dart';

import '../widgets/create_offer_app_bar.dart';

class CreateOfferView extends StatefulWidget {
  const CreateOfferView({super.key});

  @override
  State<CreateOfferView> createState() => _CreateOfferViewState();
}

class _CreateOfferViewState extends State<CreateOfferView> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FileCubit(),
        ),
      ],
      child: Scaffold(
          body: Column(
        children: [
          CreateOfferAppbar(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(20),
                    ProjectTextField(
                      labelText: 'Offers details',
                      controller:
                          context.read<OfferCubit>().offerDetailsController,
                      maxLines: 4,
                    ),
                    verticalSpace(25),
                    DeliveryTimeSection(),
                    verticalSpace(25),
                    SelectOfferBudget(),
                    verticalSpace(25),
                    Text(
                      "Attachments Files",
                      style: AppStyle.poppinsMedium14,
                    ),
                    verticalSpace(12),
                    AttachmentFilesSection(),
                    verticalSpace(60),
                    CreateOfferButton(),
                    verticalSpace(100),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
