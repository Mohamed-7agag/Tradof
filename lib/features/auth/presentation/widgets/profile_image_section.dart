import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/freelancer_registeration_cubit.dart';
import 'create_account_curve_with_image.dart';

class ProfileImageSection extends StatelessWidget {
  const ProfileImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileImageAndCountryCubit,
        ProfileImageAndCountryState>(
      buildWhen: (previous, current) =>
          previous.imagePicked != current.imagePicked,
      builder: (context, state) {
        return CreateAccountCurveWithImage(
          onImagePicked: (image) {
            context.read<ProfileImageAndCountryCubit>().onImagePicked(image);
          },
        );
      },
    );
  }
}
