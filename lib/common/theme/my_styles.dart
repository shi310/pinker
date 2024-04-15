import 'package:flutter/material.dart';
import 'package:pinker/common/index.dart';

class MyStyles {
  static const textStyleLight = TextStyle(
    color: MyColors.white,
    height: 0,
    fontSize: 14,
  );

  static const textStyleDark = TextStyle(
    height: 1,
    fontSize: 14,
    color: MyColors.black,
  );

  static const textStylePrimary = TextStyle(
    height: 1,
    fontSize: 14,
    color: MyColors.primaryColor,
  );

  static const textStyleDisable = TextStyle(
    color: MyColors.onFilledButtonDisableColor,
    height: 1,
    fontSize: 14,
  );

  static final filledButtonStyle = ButtonStyle(
    textStyle: MaterialStateProperty.all<TextStyle?>(MyStyles.textStyleLight),
    backgroundColor:
        MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return MyColors.secondColor;
      }
      if (states.contains(MaterialState.disabled)) {
        return MyColors.geryTranslucent;
      }
      return MyColors.primaryColor;
    }),
    foregroundColor:
        MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return MyColors.onFilledButtonDisableColor;
      }
      return MyColors.white;
    }),
    padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
        const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0)),
  );

  static final textButtonStyle = ButtonStyle(
    textStyle: MaterialStateProperty.all<TextStyle?>(MyStyles.textStyleLight),
    backgroundColor:
        MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return MyColors.secondColor;
      }
      if (states.contains(MaterialState.disabled)) {
        return MyColors.geryTranslucent;
      }
      return MyColors.primaryColor;
    }),
    foregroundColor:
        MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return MyColors.onFilledButtonDisableColor;
      }
      return MyColors.white;
    }),
    padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(EdgeInsets.zero),
  );
}
