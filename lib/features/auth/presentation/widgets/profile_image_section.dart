import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/registeration_cubit/registeration_cubit.dart';
import 'create_account_curve_with_image.dart';

class ProfileImageSection extends StatelessWidget {
  const ProfileImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CreateAccountCurveWithImage(
      onImagePicked: (image) {
        context
            .read<RegisterationCubit>()
            .setCountryAndImageProfile(imageProfile: image);
      },
    );
  }
}
