import 'package:flutter/material.dart';
import 'package:flutter_tutorial/utility/constants.dart';

getLightTheme(BuildContext context){
  return ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    iconTheme: IconThemeData(color: kContentColorLightTheme),
    colorScheme: ColorScheme.light().copyWith(
      primary: kPrimaryColor,
      secondary:kSecondaryColor,
      error: kErrorColor,
    )
  );
}