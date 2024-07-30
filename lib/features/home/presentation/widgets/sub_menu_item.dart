import 'package:flutter/material.dart';

import '../../../../core/theme/fonts.dart';

class SubMenuItem extends StatefulWidget {
  const SubMenuItem({
    super.key,
    required this.text,
    this.isActive = false,
    required this.onPressed,
  });

  final String text;
  final bool isActive;
  final Function onPressed;

  @override
  State<SubMenuItem> createState() => _SubMenuItemState();
}

class _SubMenuItemState extends State<SubMenuItem> {
  bool isHovered = false;
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      color: isHovered
          ? Colors.white.withOpacity(0.1)
          : widget.isActive
              ? Colors.white.withOpacity(0.1)
              : Colors.transparent,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.isActive ? null : () => widget.onPressed(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 10,
            ),
            child: MouseRegion(
              onEnter: (_) => setState(() => isHovered = true),
              onExit: (_) => setState(() => isHovered = false),
              child: Row(children: [
                Icon(
                  Icons.chevron_right_rounded,
                  color: Colors.white.withOpacity(0.5),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    widget.text,
                    maxLines: 2,
                    style: textTitleStyle,
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
