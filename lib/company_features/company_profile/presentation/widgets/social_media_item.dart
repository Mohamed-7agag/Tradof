import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/widgets/custom_text_field.dart';

class SocialMediaItem extends StatelessWidget {
  const SocialMediaItem(
      {required this.image, required this.controller, super.key});
  final String image;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Image.asset(image, width: 45),
        horizontalSpace(14),
        Expanded(
          child: CustomTextField(
            labelText: 'link',
            controller: controller,
          ),
        ),
      ],
    );
  }
}
