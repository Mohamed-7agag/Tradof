import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tradof/core/di/di.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';
import 'package:tradof/core/utils/logic/meta_data_cubit/meta_data_cubit.dart';
import 'package:tradof/core/utils/widgets/custom_button.dart';
import 'package:tradof/core/utils/widgets/custom_text_field.dart';
import 'package:tradof/features/auth/presentation/logic/freelancer_registeration_cubit.dart';
import 'package:tradof/features/auth/presentation/widgets/phone_number_text_field.dart';
import 'package:tradof/features/company/profile_company/data/model/company_model.dart';
import 'package:tradof/features/company/profile_company/presentation/widgets/country_drop_down_edit.dart';
import 'package:tradof/features/company/profile_company/presentation/widgets/profile_image_edit.dart';

class EditProfileCompanyView extends StatefulWidget {
  const EditProfileCompanyView({super.key, required this.companyModel});
  final CompanyModel companyModel;

  @override
  State<EditProfileCompanyView> createState() => _EditProfileCompanyViewState();
}

class _EditProfileCompanyViewState extends State<EditProfileCompanyView> {
  late final GlobalKey<FormState> formKey;

  late final TextEditingController emailController;
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController phoneNumberController;
  late final TextEditingController locationCompanyController;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController(text: widget.companyModel.email);
    firstNameController =
        TextEditingController(text: widget.companyModel.firstName);
    lastNameController =
        TextEditingController(text: widget.companyModel.lastName);
    phoneNumberController =
        TextEditingController(text: widget.companyModel.phone.substring(1));
    locationCompanyController =
        TextEditingController(text: widget.companyModel.companyAddress);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProfileImageAndCountryCubit(),
          ),
          BlocProvider(
            create: (context) => MetaDataCubit(getIt())..getCountries(),
          ),
        ],
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(35),
              ProfileImageEdit(),
              verticalSpace(40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    CustomTextField(
                      labelText: 'First Name',
                      labelColor: AppColors.darkGrey,
                      controller: firstNameController,
                      keyboardType: TextInputType.text,
                      labelBehavior: true,
                      outlineBorder: false,
                    ),
                    verticalSpace(20),
                    CustomTextField(
                      labelText: 'Last Name',
                      labelColor: AppColors.darkGrey,
                      controller: lastNameController,
                      keyboardType: TextInputType.text,
                      labelBehavior: true,
                      outlineBorder: false,
                    ),
                    verticalSpace(20),
                    CustomTextField(
                      labelText: 'Email',
                      labelColor: AppColors.darkGrey,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      labelBehavior: true,
                      outlineBorder: false,
                    ),
                    verticalSpace(20),
                    PhoneNumberTextField(
                      labelText: 'Phone Number',
                      controller: phoneNumberController,
                      borderColor: AppColors.darkGrey,
                      labelBehavior: true,
                    ),
                    verticalSpace(20),
                    CountryDropDownEdit(),
                    verticalSpace(20),
                    CustomTextField(
                      labelText: 'Location',
                      labelColor: AppColors.darkGrey,
                      controller: locationCompanyController,
                      labelBehavior: true,
                      outlineBorder: false,
                    ),
                    verticalSpace(40),
                    CustomButton(text: 'Save', onPressed: () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      centerTitle: true,
      title: Text(
        'Personal Info',
        style: AppStyle.robotoBold20.copyWith(color: AppColors.primary),
      ),
      actions: [
        SvgPicture.asset(
          'assets/images/edit.svg',
          colorFilter: const ColorFilter.mode(
            AppColors.primary,
            BlendMode.srcIn,
          ),
        ),
        horizontalSpace(16),
      ],
      toolbarHeight: 65,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
