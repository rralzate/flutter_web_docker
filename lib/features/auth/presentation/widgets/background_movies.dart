import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/routes/resource_icons.dart';

class BackgroundMovies extends StatelessWidget {
  const BackgroundMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: buildBoxDecoration(),
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 400,
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Image(
                  image: AssetImage(logoTwitterWhite),
                  width: 400,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
            ]),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return const BoxDecoration(
        image: DecorationImage(
      image: AssetImage(
        backgroundLogin,
      ),
      fit: BoxFit.cover,
    ));
  }
}
