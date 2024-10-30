import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swap/core/constants/swap_style.dart';

class SwapTextField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  final double? width, height;

  final String? hintText;

  final bool? autofocus, search;

  final int? maxLength;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;


  const SwapTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    this.width,
    this.height,
    this.hintText,
    this.autofocus = false,
    this.search = false,
    this.maxLength,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
  });

  @override
  State<SwapTextField> createState() => _SwapTextFieldState();
}

class _SwapTextFieldState extends State<SwapTextField> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 26,
      width: widget.width ?? MediaQuery.of(context).size.width,
      child: TextFormField(
        controller: widget.controller,
        focusNode: widget.focusNode,

        textInputAction: widget.textInputAction,

        autofocus: widget.autofocus!,

        cursorHeight: 16,
        cursorWidth: 1,

        maxLength: widget.maxLength,

        keyboardType: widget.textInputType,

        style: SwapTextStyle.bodySmall(
          color: SwapColor.black,
        ),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: SwapTextStyle.bodySmall(
            color: SwapColor.gray400,
          ),

          filled: true,
          fillColor: SwapColor.gray50,

          contentPadding: const EdgeInsets.symmetric(horizontal: 16),

          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),

          suffixIcon: widget.search! ? SvgPicture.asset("$iconCoreAsset/search_icon.svg") : null,

          // enabledBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(8),
          //   borderSide: BorderSide(
          //     color: WESTColor.gray500,
          //     width: 2,
          //   ),
          // ),
        ),

        onTap: () {
          FocusScope.of(context).hasFocus
              ? FocusScope.of(context).unfocus()
              : FocusScope.of(context).hasFocus;
        },

        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
      ),
    );
  }
}
