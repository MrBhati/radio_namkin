import 'package:flutter/material.dart';

class ColorSingletion {
  // final Color color1;
  // final Color color2;  
  // final Alignment begin;
  // final Alignment end;
   Color? colorBackground;
   Color? colorDark;
   Color? colorLight;
   Color? colorText;


  static ColorSingletion? _instance;

  factory ColorSingletion({required Color colorBackground, required Color colorDark, required Color colorLight, required Color colorText})
  {
    _instance ??= ColorSingletion._internal(colorBackground,colorDark,colorLight,colorText);
    return _instance!;
  }

  ColorSingletion._internal(this.colorBackground, this.colorDark, this.colorLight, this.colorText);

  static ColorSingletion? get instance {
    return _instance;
  }
}