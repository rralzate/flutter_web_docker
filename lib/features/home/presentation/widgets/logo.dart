import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/routes/resource_icons.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Center(
        child: Image.asset(
          logoTwitterWhite,
          width: 10.w,
          height: 10.h,
        ),
      ),
    );
  }
}
