import '../../../../core/theme/fonts.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatefulWidget {
  const MenuItem({
    super.key,
    required this.text,
    required this.icon,
    this.isActive = false,
    required this.onPressed,
    this.iconVisible = true,
  });

  final String text;
  final IconData icon;
  final bool isActive;
  final Function onPressed;
  final bool iconVisible;

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool isHovered = false;
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
              horizontal: 20,
              vertical: 10,
            ),
            child: MouseRegion(
              onEnter: (_) => setState(() => isHovered = true),
              onExit: (_) => setState(() => isHovered = false),
              child: Row(children: [
                Icon(
                  widget.icon,
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
                ),
                Visibility(
                  visible: widget.iconVisible,
                  child: Icon(
                    Icons.add_box_rounded,
                    size: 15,
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
