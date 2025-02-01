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
          LinkIcon(image: 'assets/images/facebook.png'),
          LinkIcon(image: 'assets/images/linkedin.png'),
          LinkIcon(image: 'assets/images/google.png'),
          
        ],
      ),
    );
  }
}
