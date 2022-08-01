import 'package:flutter/material.dart';
import '../constants/color_constant.dart';
import '../constants/sizeConstant.dart';

Widget getTextField({
  String? hintText,
  TextEditingController? textEditingController,
  Widget? prefixIcon,
  Widget? prefix,
  double? borderRadius,
  Widget? suffixIcon,
  double? size = 52,
  Widget? suffix,
  Color borderColor = Colors.transparent,
  Color? fillColor,
  TextInputType textInputType = TextInputType.name,
  TextInputAction textInputAction = TextInputAction.next,
  bool textVisible = false,
  bool readOnly = false,
  VoidCallback? onTap,
  int maxLine = 1,
  FormFieldValidator<String>? validation,
  double height = 60,
  double width = 335,
  double hintSize = 14,
  bool inlineBorder = false,
}) {
  return Container(
    height: MySize.getHeight(height),
    width: MySize.getWidth(width),
    child: TextFormField(
      controller: textEditingController,
      obscureText: textVisible,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      cursorColor: appTheme.primaryTheme,
      readOnly: readOnly,
      validator: validation,
      onTap: onTap,
      maxLines: maxLine,
      decoration: InputDecoration(
        fillColor: isNullEmptyOrFalse(fillColor)
            ? Color(0xff262626).withOpacity(0.09)
            : fillColor,
        filled: true,
        enabledBorder: (inlineBorder)
            ? UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Color(0xff262626).withOpacity(0.5)))
            : OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.circular((borderRadius == null)
                    ? MySize.getHeight(10)
                    : borderRadius),
              ),
        focusedBorder: (inlineBorder)
            ? UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Color(0xff262626).withOpacity(0.5)))
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular((borderRadius == null)
                    ? MySize.getHeight(10)
                    : borderRadius),
                borderSide: BorderSide(color: borderColor),
              ),
        errorBorder: (inlineBorder)
            ? UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Color(0xff262626).withOpacity(0.5)))
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular((borderRadius == null)
                    ? MySize.getHeight(10)
                    : borderRadius),
                borderSide: BorderSide(color: borderColor),
              ),
        border: (inlineBorder)
            ? UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Color(0xff262626).withOpacity(0.5)))
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular((borderRadius == null)
                    ? MySize.getHeight(10)
                    : borderRadius),
              ),
        contentPadding: EdgeInsets.only(
          left: (inlineBorder) ? 0 : MySize.getHeight(20),
          right: MySize.getHeight(10),
          bottom: (inlineBorder)
              ? MySize.getHeight(14)
              : (size! / 2), // HERE THE IMPORTANT PART
        ),
        prefixIcon: prefixIcon,
        prefix: prefix,
        suffixIcon: suffixIcon,
        suffix: suffix,
        hintText: hintText,
        hintStyle: TextStyle(fontSize: MySize.getHeight(hintSize)),
      ),
    ),
  );
}
