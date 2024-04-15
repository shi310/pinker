import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  const MyButton({
    super.key,
    this.width,
    this.height,
    this.onTap,
    this.child,
    this.borderRadius = const BorderRadius.all(Radius.circular(40)),
    this.color,
    this.padding = const EdgeInsets.only(left: 16, right: 16),
    this.isDebouncing = true,
    this.onTapDownColor,
  });

  final double? width;
  final double? height;
  final void Function()? onTap;
  final Widget? child;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;
  final Color? onTapDownColor;
  final EdgeInsetsGeometry? padding;
  final bool isDebouncing;

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton>
    with SingleTickerProviderStateMixin {
  bool isDisable = false;
  bool isTapDown = false;

  Future<void> handleTap() async {
    if (widget.isDebouncing) {
      setState(() {
        isDisable = true;
        isTapDown = true;
      });
      await Future.delayed(const Duration(milliseconds: 500));
      if (mounted) {
        setState(() {
          isDisable = false;
          isTapDown = false;
        });
      }
      widget.onTap?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      borderRadius: widget.borderRadius,
      color: isTapDown && widget.onTapDownColor != null
          ? widget.onTapDownColor
          : widget.color,
      shape: BoxShape.rectangle,
    );

    final buttonContent = Container(
      alignment: Alignment.center,
      width: widget.width,
      height: widget.height,
      decoration: decoration,
      clipBehavior: Clip.antiAlias,
      padding: widget.padding,
      child: widget.child,
    );

    return GestureDetector(
      onTapDown: widget.onTap == null
          ? null
          : (details) => setState(() => isTapDown = true),
      onTapUp: widget.onTap == null ? null : (details) => handleTap(),
      onTapCancel: () => setState(() => isTapDown = false),
      child: Opacity(
        opacity: isTapDown ? 0.5 : 1,
        child: buttonContent,
      ),
    );
  }
}
