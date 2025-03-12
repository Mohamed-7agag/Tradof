import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../core/utils/widgets/custom_app_bar.dart';

class SettingAppBar extends StatelessWidget {
  const SettingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return customAppbar(
      title: 'Settings',
      actionIcon: HugeIcons.strokeRoundedSettings02,
      titlePadding: 16.w,
    );
  }
}
