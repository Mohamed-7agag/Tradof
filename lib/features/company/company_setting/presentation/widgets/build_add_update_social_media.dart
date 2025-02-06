import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/utils/widgets/custom_text_field.dart';
import 'package:tradof/features/company/company_setting/data/model/social_media_model.dart';
import 'package:tradof/features/company/company_setting/presentation/widgets/add_update_social_media_button.dart';

class BuildAddUpdateSocialMedia extends StatefulWidget {
  const BuildAddUpdateSocialMedia({
    super.key,
    required this.socialMediaModel,
  });
  final List<SocialMediaModel> socialMediaModel;

  @override
  State<BuildAddUpdateSocialMedia> createState() =>
      _BuildAddUpdateSocialMediaState();
}

class _BuildAddUpdateSocialMediaState extends State<BuildAddUpdateSocialMedia> {
  late TextEditingController facebookController;
  late TextEditingController linkedinController;
  late TextEditingController gamilController;
  @override
  void initState() {
    facebookController = TextEditingController();
    linkedinController = TextEditingController();
    gamilController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(30),
              CustomTextField(
                labelText: 'link',
                controller: facebookController,
                outlineBorder: true,
              ),
              verticalSpace(16),
              CustomTextField(
                labelText: 'link',
                controller: linkedinController,
                outlineBorder: true,
              ),
              verticalSpace(16),
              CustomTextField(
                labelText: 'link',
                controller: gamilController,
                outlineBorder: true,
              ),
              verticalSpace(60),
              AddUpdateSocialMediaButton(
                facebookController: facebookController,
                linkedinController: linkedinController,
                gamilController: gamilController,
              ),
              verticalSpace(40),
            ],
          ),
        ),
      ),
    );
  }
}
