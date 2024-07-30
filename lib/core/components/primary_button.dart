import '../theme/colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.height,
    this.width,
    this.child,
    this.onPressed,
    this.backgroundColor = secondColor,
  });

  final double? height;
  final double? width;
  final Widget? child;
  final VoidCallback? onPressed;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: backgroundColor,
          disabledBackgroundColor: mainGrey,
        ),
        child: child,
      ),
    );
  }
}
