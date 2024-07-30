import '../../../../core/theme/fonts.dart';
import 'package:flutter/material.dart';

class InternalMenu extends StatefulWidget {
  const InternalMenu({
    super.key,
    required this.text,
    this.isActive = false,
    required this.onPressed,
    this.iconVisible = true,
  });

  final String text;
  final bool isActive;
  final Function onPressed;
  final bool iconVisible;

  @override
  State<InternalMenu> createState() => _InternalMenuState();
}

class _InternalMenuState extends State<InternalMenu> {
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
            padding:  const EdgeInsets.fromLTRB(40, 5, 20, 5),
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
