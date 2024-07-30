import '../routes/resource_icons.dart';
import '../theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../theme/fonts.dart';

class NotificationsService {
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackbarError(String message) {
    final snackBar = SnackBar(
        backgroundColor: redColor,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.all(20),
        behavior: SnackBarBehavior.floating,
        width: 50.w,
        elevation: 5,
        duration: const Duration(milliseconds: 5000),
        dismissDirection: DismissDirection.none,
        content: Text(
          message,
          style: textStyleNormal(colorWhite),
        ));

    messengerKey.currentState!.showSnackBar(snackBar);
  }

  static showSnackbar(String message) {
    final snackBar = SnackBar(
        backgroundColor: primaryColor,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.all(20),
        behavior: SnackBarBehavior.floating,
        width: 50.w,
        elevation: 5,
        duration: const Duration(milliseconds: 5000),
        dismissDirection: DismissDirection.none,
        content: Text(
          message,
          style: textStyleNormal(colorWhite),
        ));

    messengerKey.currentState!.showSnackBar(snackBar);
  }

  static showAlertIndicator(BuildContext context) {
    final AlertDialog dialog = AlertDialog(
      content: Container(
        alignment: Alignment.center,
        width: 100,
        height: 100,
        color: darkGrey.withOpacity(0.2),
        child: SizedBox(
          child: SizedBox(
            child: Image(
              image: const AssetImage(loadingGIF),
              fit: BoxFit.cover,
              height: 5.h,
            ),
          ),
        ),
      ),
    );

    showDialog(context: context, builder: (_) => dialog);
  }
}
