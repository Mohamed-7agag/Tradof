import 'package:flutter/material.dart';
import 'package:tradof/features/company/profile_company/presentation/widgets/link_icon.dart';


class SocialLinks extends StatelessWidget {
  const SocialLinks({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LinkIcon(icon: 'assets/images/facebook.svg'),
          LinkIcon(icon: 'assets/images/Linkedin.svg'),
          LinkIcon(icon: 'assets/images/google.svg'),
          LinkIcon(icon: 'assets/images/location.svg'),
          LinkIcon(icon: 'assets/images/whatsapp.svg'),
        ],
      ),
    );
  }
}
