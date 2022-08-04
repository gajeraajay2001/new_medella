import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MySize {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? safeWidth;
  static double? safeHeight;

  static late double scaleFactorWidth;
  static late double scaleFactorHeight;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);

    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

    double _safeAreaWidth =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    double _safeAreaHeight =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeWidth = (screenWidth - _safeAreaWidth);
    safeHeight = (screenHeight - _safeAreaHeight);

    safeWidth = (screenWidth - _safeAreaWidth);
    safeHeight = (screenHeight - _safeAreaHeight);

    scaleFactorHeight = (safeHeight! / 768);
    if (scaleFactorHeight < 1) {
      double diff = (1 - scaleFactorHeight) * (1 - scaleFactorHeight);
      scaleFactorHeight += diff;
    }

    scaleFactorWidth = (safeWidth! / 375);

    if (scaleFactorWidth < 1) {
      double diff = (1 - scaleFactorWidth) * (1 - scaleFactorWidth);
      scaleFactorWidth += diff;
    }
  }

  static double getWidth(double size) {
    return (size * scaleFactorWidth);
  }

  static double getHeight(double size) {
    return (size * scaleFactorHeight);
  }
}

class Spacing {
  static EdgeInsetsGeometry zero = EdgeInsets.zero;

  static EdgeInsetsGeometry only(
      {double top = 0, double right = 0, double bottom = 0, double left = 0}) {
    return EdgeInsets.only(
      left: MySize.getWidth(left),
      right: MySize.getWidth(right),
      top: MySize.getHeight(top),
      bottom: MySize.getHeight(bottom),
    );
  }

  static EdgeInsetsGeometry fromLTRB(
      double left, double top, double right, double bottom) {
    return Spacing.only(bottom: bottom, top: top, right: right, left: left);
  }

  static EdgeInsetsGeometry all(double spacing) {
    return Spacing.only(
        bottom: MySize.getHeight(spacing),
        top: MySize.getHeight(spacing),
        right: MySize.getWidth(spacing),
        left: MySize.getWidth(spacing));
  }

  static EdgeInsetsGeometry left(double spacing) {
    return Spacing.only(left: spacing);
  }

  static EdgeInsetsGeometry nLeft(double spacing) {
    return Spacing.only(top: spacing, bottom: spacing, right: spacing);
  }

  static EdgeInsetsGeometry top(double spacing) {
    return Spacing.only(top: spacing);
  }

  static EdgeInsetsGeometry nTop(double spacing) {
    return Spacing.only(left: spacing, bottom: spacing, right: spacing);
  }

  static EdgeInsetsGeometry right(double spacing) {
    return Spacing.only(right: spacing);
  }

  static EdgeInsetsGeometry nRight(double spacing) {
    return Spacing.only(top: spacing, bottom: spacing, left: spacing);
  }

  static EdgeInsetsGeometry bottom(double spacing) {
    return Spacing.only(bottom: spacing);
  }

  static EdgeInsetsGeometry nBottom(double spacing) {
    return Spacing.only(top: spacing, left: spacing, right: spacing);
  }

  static EdgeInsetsGeometry horizontal(double spacing) {
    return Spacing.only(left: spacing, right: spacing);
  }

  static x(double spacing) {
    return Spacing.only(left: spacing, right: spacing);
  }

  static xy(double xSpacing, double ySpacing) {
    return Spacing.only(
        left: xSpacing, right: xSpacing, top: ySpacing, bottom: ySpacing);
  }

  static y(double spacing) {
    return Spacing.only(top: spacing, bottom: spacing);
  }

  static EdgeInsetsGeometry vertical(double spacing) {
    return Spacing.only(
        top: MySize.getHeight(spacing), bottom: MySize.getHeight(spacing));
  }

  static EdgeInsetsGeometry symmetric(
      {double vertical = 0, double horizontal = 0}) {
    return Spacing.only(
        top: MySize.getHeight(vertical),
        right: MySize.getWidth(horizontal),
        left: MySize.getWidth(horizontal),
        bottom: MySize.getHeight(vertical));
  }

  static Widget height(double height) {
    return SizedBox(
      height: MySize.getHeight(height),
    );
  }

  static Widget width(double width) {
    return SizedBox(
      width: MySize.getWidth(width),
    );
  }
}

class Space {
  Space();

  static Widget height(double space) {
    return SizedBox(
      height: MySize.getHeight(space),
    );
  }

  static Widget width(double space) {
    return SizedBox(
      width: MySize.getHeight(space),
    );
  }
}

enum ShapeTypeFor { container, button }

class Shape {
  static dynamic circular(double radius,
      {ShapeTypeFor shapeTypeFor = ShapeTypeFor.container}) {
    BorderRadius borderRadius =
        BorderRadius.all(Radius.circular(MySize.getHeight(radius)));

    switch (shapeTypeFor) {
      case ShapeTypeFor.container:
        return borderRadius;
      case ShapeTypeFor.button:
        return RoundedRectangleBorder(borderRadius: borderRadius);
    }
  }

  static dynamic circularTop(double radius,
      {ShapeTypeFor shapeTypeFor = ShapeTypeFor.container}) {
    BorderRadius borderRadius = BorderRadius.only(
        topLeft: Radius.circular(MySize.getHeight(radius)),
        topRight: Radius.circular(MySize.getHeight(radius)));
    switch (shapeTypeFor) {
      case ShapeTypeFor.container:
        return borderRadius;

      case ShapeTypeFor.button:
        return RoundedRectangleBorder(borderRadius: borderRadius);
    }
  }
}

bool isNullEmptyOrFalse(dynamic o) {
  if (o is Map<String, dynamic> || o is List<dynamic>) {
    return o == null || o.length == 0;
  }
  return o == null || false == o || "" == o;
}

getSnackBar(
    {required BuildContext context,
    String text = "",
    double size = 16,
    int duration = 500}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text, style: TextStyle(fontSize: MySize.getHeight(size))),
      duration: Duration(milliseconds: duration),
    ),
  );
}

String getFirstTwoLetterCapital({required String text}) {
  return (!isNullEmptyOrFalse(text))
      ? (text.length == 1)
          ? text.toUpperCase()
          : (text.length >= 2)
              ? "${text[0].toUpperCase()}${text[1].toUpperCase()}"
              : "gkg"
      : "gsg";
}

CachedNetworkImage getImageByLink(
    {required String url,
    required double height,
    required double width,
    bool isLoading = false,
    bool colorFilter = false,
    BoxFit boxFit = BoxFit.contain}) {
  return CachedNetworkImage(
    imageUrl: url,
    imageBuilder: (context, imageProvider) => Container(
      height: MySize.getHeight(height),
      width: MySize.getWidth(width),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: imageProvider,
          fit: boxFit,
          colorFilter: (colorFilter)
              ? ColorFilter.mode(
                  Colors.black.withOpacity(0.6), BlendMode.darken)
              : null,
        ),
      ),
    ),
    placeholder: (context, url) => Container(
      height: 30,
      width: 30,
      child: LinearProgressIndicator(
        color: Colors.grey.shade200,
        backgroundColor: Colors.grey.shade100,
      ),
    ),
    errorWidget: (context, url, error) =>
        Image(image: AssetImage("assets/user_image.png")),
  );
}

DateTime getLastDateOfMonth({required DateTime date}) {
  DateTime lastDayOfMonth = DateTime(date.year, date.month + 1, 0);
  DateTime fDayOfMonth = DateTime(date.year, date.month, 1);
  return lastDayOfMonth;
}

DateTime getDateFromString(String dateString, {String? formatter}) {
  const String kMainSourceFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ";
  if (formatter == null) {
    formatter = kMainSourceFormat;
  }
  return DateFormat(formatter).parse(dateString);
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

String strDigits(int n) {
  return n.toString().padLeft(2, '0');
}
