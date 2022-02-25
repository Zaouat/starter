import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle fontChanger(
  double fontSize,
  FontWeight weight,
  BuildContext context,
) {
  if (EasyLocalization.of(context)!.currentLocale.toString() == 'ar_DZ') {
    return GoogleFonts.almarai(
      fontSize: fontSize,
      fontWeight: weight,
    );
  } else {
    return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: weight,
    );
  }
}
