import 'package:flutter/material.dart';
import 'package:medella_new/app/constants/sizeConstant.dart';

class BaseTheme {
  Color get primaryTheme => fromHex('#0072FF');
  Color get borderGrayTheme => fromHex('#E5E5E5');
  Color get grayTheme => fromHex('#F2F2F2');
  Color get redColor => fromHex('#E41212');
}

BaseTheme get appTheme => BaseTheme();

Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}
