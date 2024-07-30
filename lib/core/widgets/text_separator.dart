import 'package:flutter/material.dart';

import '../theme/fonts.dart';

class TextSeparator extends StatelessWidget {
  const TextSeparator({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(bottom: 5),
      child: Text(
        text,
        style: textTitleStyle,
      ),
    );
  }
}
