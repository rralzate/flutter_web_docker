import '../../../../core/theme/colors.dart';
import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/components/custom_input.dart';

class SearchText extends StatelessWidget {
  const SearchText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: builBoxDecoration(),
      child: CustomInput(
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 1.w),
          child: const Icon(
            Icons.search_rounded,
            color: mainGrey,
          ),
        ),
        placeholder: 'Buscar',
        colorInputText: primaryColor,
        keyboardType: TextInputType.text,
        onChanged: (text) {},
      ),
    );
  }
}

BoxDecoration builBoxDecoration() => BoxDecoration(
    borderRadius: BorderRadius.circular(10), color: mainWhite.withOpacity(0.3));
