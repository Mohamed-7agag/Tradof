import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/features/auth/presentation/logic/freelancer_registeration_cubit.dart';
import 'package:tradof/features/auth/presentation/widgets/account_image_widget.dart';


class ProfileImageEdit extends StatelessWidget {
  const ProfileImageEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileImageAndCountryCubit,
        ProfileImageAndCountryState>(
      buildWhen: (previous, current) =>
          previous.imagePicked != current.imagePicked,
      builder: (context, state) {
        return AccountImageWidget(onImagePicked: (image) {
          context.read<ProfileImageAndCountryCubit>().onImagePicked(image);
        });
      },
    );
  }
}
