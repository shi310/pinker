import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

class MyInput extends StatefulWidget {
  const MyInput({
    super.key,
    required this.controller,
    required this.focusNode,
    this.maxLines = 1,
    this.onSubmitted,
    this.textInputAction,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText = Lang.defaultHintText,
    this.obscureText = false,
    this.width = double.infinity,
    this.height = 36,
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
    this.onTap,
    this.autofocus = false,
    this.enabled,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputAction? textInputAction;
  final void Function(String)? onSubmitted;
  final TextInputType? keyboardType;
  final int maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hintText;
  final bool obscureText;
  final double width;
  final double height;
  final BorderRadiusGeometry borderRadius;
  final void Function()? onTap;
  final bool autofocus;
  final bool? enabled;

  @override
  State<MyInput> createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  Widget? _suffixIcon;

  void clear() {
    setState(() => _suffixIcon = null);
    widget.controller.clear();
    widget.focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final clearButton = MyButton(
      width: widget.height,
      height: widget.height,
      onTap: clear,
      child: const Icon(Icons.close, size: 18),
    );

    void setStateFunction() {
      if (widget.suffixIcon == null) {
        _suffixIcon = widget.controller.text.isEmpty ? null : clearButton;
      } else {
        _suffixIcon = widget.controller.text.isEmpty ? null : widget.suffixIcon;
      }
    }

    widget.controller.addListener(() => setState(setStateFunction));

    final hintStyle = TextStyle(
      fontSize: 14,
      color: Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
    );

    final textField = TextField(
      textInputAction: widget.textInputAction,
      scrollPadding: EdgeInsets.zero,
      focusNode: widget.focusNode,
      controller: widget.controller,
      onSubmitted: widget.onSubmitted,
      maxLines: widget.maxLines,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: _suffixIcon,
        contentPadding: EdgeInsets.zero,
        border: const OutlineInputBorder(borderSide: BorderSide.none),
        hintText: widget.hintText.tr,
        hintStyle: hintStyle,
      ),
      obscureText: widget.obscureText,
      onTap: widget.onTap,
      cursorColor: Theme.of(context).primaryColor,
      style: TextStyle(
        height: 1.4,
        fontSize: 14,
        color: Theme.of(context).colorScheme.onBackground,
      ),
      autofocus: true,
      enabled: widget.enabled,
    );

    return Container(
      width: widget.width,
      height: widget.height,
      clipBehavior: widget.borderRadius == BorderRadius.zero
          ? Clip.hardEdge
          : Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: widget.borderRadius,
        shape: BoxShape.rectangle,
        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
      ),
      child: textField,
    );
  }
}
