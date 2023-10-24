import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultMargin = 30.0;

Color primaryColor = HexColor.fromHex("#00887a");
Color lightColor = HexColor.fromHex("#1da29d");
Color secondaryColor = HexColor.fromHex("#e54914");
Color alertColor = Color(0xffED6363);
Color priceColor = Color(0xff2C96F1);
Color backgroundColor1 = Color(0xff1F1D2B);
Color backgroundColor2 = Color(0xff2B2937);
Color backgroundColor3 = Color(0xff242231);
Color backgroundColor5 = Color(0xff2B2844);
Color backgroundColor6 = Color(0xffECEDEF);
Color primaryTextColor = Color(0xF4FFFD);
Color secondaryTextColor = Color(0xff999999);
Color subtitleColor = Color(0xff504F5E);
Color backgroundColor4 = Color(0xff252836);
Color transparentColor = Colors.transparent;
Color blackColor = Color(0xff2E2E2E);

TextStyle primaryTextStyle = GoogleFonts.poppins(
  color: primaryTextColor,
);

TextStyle secondaryTextStyle = GoogleFonts.poppins(
  color: secondaryTextColor,
);

TextStyle priceTextStyle = GoogleFonts.poppins(color: priceColor);

TextStyle subtitleTextStyle = GoogleFonts.poppins(color: subtitleColor);

TextStyle purpleTextStyle = GoogleFonts.poppins(
  color: primaryColor,
);

TextStyle blackTextStyle = GoogleFonts.poppins(
  color: blackColor,
);

TextStyle alertTextStyle = GoogleFonts.poppins(
  color: alertColor,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
