import 'package:flutter/material.dart';

class NotificationsIndicator extends StatelessWidget {
  const NotificationsIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Icon(
          Icons.notifications_none_rounded,
          color: Colors.grey,
        ),
        Positioned(
          left: 2,
          child: Container(
            width: 5,
            height: 5,
            decoration: builBoxDecotation(),
          ),
        )
      ],
    );
  }
}

BoxDecoration builBoxDecotation() =>
    BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.red);
