import 'package:flutter/material.dart';

const pretendard = "Pretendard";

class SwapTextStyle {
  SwapTextStyle._();

  static TextStyle titleLarge({
    required Color color,
    TextOverflow overflow = TextOverflow.visible,
  }) {
    return TextStyle(
      color: color,
      fontSize: 48,
      fontWeight: FontWeight.w600,
      fontFamily: pretendard,
      height: 1.208,
      overflow: overflow,
    );
  }

  static TextStyle titleMedium({
    required Color color,
    TextOverflow overflow = TextOverflow.visible,
  }) {
    return TextStyle(
      color: color,
      fontSize: 36,
      fontWeight: FontWeight.w600,
      fontFamily: pretendard,
      height: 1.194,
      overflow: overflow,
    );
  }

  static TextStyle titleSmall({
    required Color color,
    TextOverflow overflow = TextOverflow.visible,
  }) {
    return TextStyle(
      color: color,
      fontSize: 24,
      fontWeight: FontWeight.w600,
      fontFamily: pretendard,
      height: 1.291,
      overflow: overflow,
    );
  }

  static TextStyle subTitle({
    required Color color,
    TextOverflow overflow = TextOverflow.visible,
  }) {
    return TextStyle(
      color: color,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: pretendard,
      height: 1.500,
      overflow: overflow,
    );
  }

  static TextStyle bodyLarge({
    required Color color,
    TextOverflow overflow = TextOverflow.visible,
  }) {
    return TextStyle(
      color: color,
      fontSize: 18,
      fontWeight: FontWeight.w400,
      fontFamily: pretendard,
      height: 1.500,
      overflow: overflow,
    );
  }

  static TextStyle bodyMedium({
    required Color color,
    TextOverflow overflow = TextOverflow.visible,
  }) {
    return TextStyle(
      color: color,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: pretendard,
      height: 1.250,
      overflow: overflow,
    );
  }

  static TextStyle bodySmall({
    required Color color,
    TextOverflow overflow = TextOverflow.visible,
  }) {
    return TextStyle(
      color: color,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: pretendard,
      height: 1.625,
      overflow: overflow,
    );
  }

  static TextStyle label({
    required Color color,
    TextOverflow overflow = TextOverflow.visible,
  }) {
    return TextStyle(
      color: color,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontFamily: pretendard,
      height: 1.500,
      overflow: overflow,
    );
  }

  static TextStyle navi({
    required Color color,
    TextOverflow overflow = TextOverflow.visible,
  }) {
    return TextStyle(
      color: color,
      fontSize: 8,
      fontWeight: FontWeight.w600,
      fontFamily: pretendard,
      height: 1.500,
      overflow: overflow,
    );
  }
}
