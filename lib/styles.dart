import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color colorPrimary = Color(0XFFFF8A58);
const Color colorOnPrimary = Color(0XFFFFFFFF);
const Color colorBgDark = Color(0xff000000);
const Color colorOnBg = Color(0XFFFFFFFF);
const Color colorBgDarkAccent = Color(0xff1D1D1D);
const Color colorBGDarkSecondaryAccent = Color(0xff2F2F31);
const Color colorAccentBlue = Color(0xffA7E8E5);
const Color colorDivider = Color(0xFF707070);

final TextTheme myTextTheme = TextTheme(
  headline1: GoogleFonts.ubuntu(
    fontSize: 92,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
    color: colorOnBg,
  ),
  headline2: GoogleFonts.ubuntu(
    fontSize: 57,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
    color: colorOnBg,
  ),
  headline3: GoogleFonts.ubuntu(
    fontSize: 46,
    fontWeight: FontWeight.w400,
    color: colorOnBg,
  ),
  headline4: GoogleFonts.ubuntu(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    color: colorOnBg,
  ),
  headline5: GoogleFonts.ubuntu(
    fontSize: 23,
    fontWeight: FontWeight.w400,
    color: colorOnBg,
  ),
  headline6: GoogleFonts.ubuntu(
    fontSize: 19,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    color: colorOnBg,
  ),
  subtitle1: GoogleFonts.ubuntu(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    color: colorOnBg,
  ),
  subtitle2: GoogleFonts.ubuntu(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    color: colorOnBg,
  ),
  bodyText1: GoogleFonts.ubuntu(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    color: colorOnBg,
  ),
  bodyText2: GoogleFonts.ubuntu(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    color: colorOnBg,
  ),
  button: GoogleFonts.ubuntu(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
    color: colorOnBg,
  ),
  caption: GoogleFonts.ubuntu(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    color: colorOnBg,
  ),
  overline: GoogleFonts.ubuntu(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
    color: colorOnBg,
  ),
);
