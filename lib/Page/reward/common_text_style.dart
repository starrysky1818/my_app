import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:sur/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* Visual design specification */

const kRedTextShadowStyle = <Shadow>[
   Shadow(
    offset: Offset(3.0, 3.0),
    blurRadius: 1.0,
    color: Color(0xFFE57262),
  ),
];

const kRedTextShadowStyle2 = <Shadow>[
   Shadow(
    offset: Offset(1.0, 1.0),
    blurRadius: 1.0,
    color: Color(0xFFE57262),
  ),
];

const kBoxShadowStyle1 = <BoxShadow>[
   BoxShadow(color: Color.fromRGBO(12, 0, 51, 0.05), offset: Offset(0, 2),blurRadius: 4)
];

const kBoxShadowStyle2 = <BoxShadow>[
   BoxShadow(color: Color.fromRGBO(12, 0, 51, 0.05), offset: Offset(0, 4),blurRadius: 8)
];

const kBoxShadowStyle3 = <BoxShadow>[
   BoxShadow(color: Color(0x1A0C0033), offset: Offset(0, 0),blurRadius: 8)
];


const kBaseColor =  Color(0xFF63A4F8);

const kBaseBackgroundColor = Color(0xFFFAFAFA);
const kFuncationBackgroundColor = Color(0xFFF5F5F5);
const kDivider = Color(0xFFDCDCDC);
const kSeparatedColor = Color(0xFFEAEAEA);

const kDisabledColor = Color(0xFFC6C6C9);

const kAssistGreenColor = Color(0xFF09C764);
const kAssistYellowColor = Color(0xFFFE7C04);
const kAssistRedColor = Color(0xFF9D3145);


const kNavTitleTextColor = Color(0xFF000000);
const kImportantTitleTextColor = Color(0xFF000000);
const kNormoalInfoTextColor = Color(0xFF666666);
const kAssistInfoTextColor = Color(0xFF999999);
const kPlaceHolderColor = Color(0xFFCCCCCC);

const kRoundIconBtnBgColor = Color(0xFF323B49);

InputDecoration fieldStyle = InputDecoration(
  hintStyle: ts_14PlaceHolderTextStyle(),
  focusedBorder:const UnderlineInputBorder(
    borderSide: BorderSide(color: kDivider, width: 0.5),
  ),
  enabledBorder:const UnderlineInputBorder(
    borderSide: BorderSide(color: kDivider, width: 0.5),
  )  
);

int fitFont(int size) {
  return size;
}

TextStyle ts_10CommonTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(20)), color: kImportantTitleTextColor);
TextStyle ts_10CommonWhiteTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(20)), color: Colors.white);
TextStyle ts_10CommonBaseTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(20)), color: kBaseColor);
TextStyle ts_10NormoaLTexTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(20)), color: kNormoalInfoTextColor);
TextStyle ts_10AssistTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(20)), color: kAssistInfoTextColor);
TextStyle ts_10AssistYellowTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(20)), color: kAssistYellowColor);
TextStyle ts_10AssistRedTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(20)), color: kAssistRedColor);
TextStyle ts_10PlaceHolderTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(20)), color: kPlaceHolderColor);
TextStyle ts_10MediumTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(20)), color:  kImportantTitleTextColor, fontWeight: FontWeight.w500);
TextStyle ts_10MPlaceHolderTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(20)), color:  kPlaceHolderColor, fontWeight: FontWeight.w500);
TextStyle ts_10BoldTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(20)), color:  kImportantTitleTextColor, fontWeight: FontWeight.bold);
TextStyle ts_10BoldDisTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(20)), color:  kDisabledColor, fontWeight: FontWeight.bold);
TextStyle ts_10BoldNavTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(20)), color:  kNavTitleTextColor, fontWeight: FontWeight.bold);
TextStyle ts_10MboldWihteTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(20)), color: Colors.white, fontWeight: FontWeight.w600);

TextStyle ts_11CommonTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(22)), color: kImportantTitleTextColor);
TextStyle ts_11CommonWhiteTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(22)), color: Colors.white);
TextStyle ts_11CommonBaseTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(22)), color: kBaseColor);
TextStyle ts_11NormoaLTexTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(22)), color: kNormoalInfoTextColor);
TextStyle ts_11AssistTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(22)), color: kAssistInfoTextColor);
TextStyle ts_11AssistYellowTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(22)), color: kAssistYellowColor);
TextStyle ts_11AssistRedTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(22)), color: kAssistRedColor);
TextStyle ts_11PlaceHolderTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(22)), color: kPlaceHolderColor);
TextStyle ts_11MediumTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(22)), color:  kImportantTitleTextColor, fontWeight: FontWeight.w500);
TextStyle ts_11MPlaceHolderTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(20)), color:  kPlaceHolderColor, fontWeight: FontWeight.w500);
TextStyle ts_11BoldTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(22)), color:  kImportantTitleTextColor, fontWeight: FontWeight.bold);
TextStyle ts_11BoldDisTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(22)), color:  kDisabledColor, fontWeight: FontWeight.bold);
TextStyle ts_11BoldNavTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(22)), color:  kNavTitleTextColor, fontWeight: FontWeight.bold);
TextStyle ts_11MboldWihteTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(22)), color: Colors.white, fontWeight: FontWeight.w600);

TextStyle ts_12CommonTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(24)), color: kImportantTitleTextColor);
TextStyle ts_12CommonWhiteTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(24)), color: Colors.white);
TextStyle ts_12NormoaLTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(24)), color: kNormoalInfoTextColor);
TextStyle ts_12MediumNormoaLTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(24)),fontWeight: FontWeight.w500, color: kNormoalInfoTextColor);
TextStyle ts_12MediumPlaceTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(24)),fontWeight: FontWeight.w500, color: kPlaceHolderColor);
TextStyle ts_12MediumBaseTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(24)),fontWeight: FontWeight.w500, color: kBaseColor);
TextStyle ts_12AssistTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(24)), color: kAssistInfoTextColor);
TextStyle ts_12AssistYellowTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(24)), color: kAssistYellowColor);
TextStyle ts_12AssistRedTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(24)), color: kAssistRedColor);
TextStyle ts_12PlaceHolderTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(24)), color: kPlaceHolderColor);
TextStyle ts_12MediumTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(24)), color:  kImportantTitleTextColor, fontWeight: FontWeight.w500);
TextStyle ts_12BoldTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(24)), color:  kImportantTitleTextColor, fontWeight: FontWeight.bold);
TextStyle ts_12BoldNavTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(24)), color:  kNavTitleTextColor, fontWeight: FontWeight.bold);
TextStyle ts_12BoldAssistInfoTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(24)), color:  kAssistInfoTextColor, fontWeight: FontWeight.bold);

TextStyle ts_13CommonTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(26)), color: kImportantTitleTextColor);
TextStyle ts_13CommonWhiteTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(26)), color: Colors.white);
TextStyle ts_13NormoaLTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(26)), color: kNormoalInfoTextColor);
TextStyle ts_13AssistTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(26)), color: kAssistInfoTextColor);
TextStyle ts_13AssistYellowTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(26)), color: kAssistYellowColor);
TextStyle ts_13AssistRedTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(26)), color: kAssistRedColor);
TextStyle ts_13PlaceHolderTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(26)), color: kPlaceHolderColor);
TextStyle ts_13MediumTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(26)), color:  kImportantTitleTextColor, fontWeight: FontWeight.w500);
TextStyle ts_13MediumDisableTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(26)), color:  kDisabledColor, fontWeight: FontWeight.w500);
TextStyle ts_13BoldTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(26)), color:  kImportantTitleTextColor, fontWeight: FontWeight.bold);
TextStyle ts_13BoldNavTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(26)), color:  kNavTitleTextColor, fontWeight: FontWeight.bold);

TextStyle ts_14CommonTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(28)), color: kImportantTitleTextColor);
TextStyle ts_14CommonWhiteTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(28)), color: Colors.white);
TextStyle ts_14CommonBaseTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(28)), color: kBaseColor);
TextStyle ts_14NormoaLTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(28)), color: kNormoalInfoTextColor,fontWeight: FontWeight.normal);
TextStyle ts_14MNormoaLTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(28)), color: kNormoalInfoTextColor,fontWeight: FontWeight.w600);

TextStyle ts_14AssistTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(28)), color: kAssistInfoTextColor,fontWeight: FontWeight.normal);
TextStyle ts_14MAssistTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(28)), color: kAssistInfoTextColor,fontWeight: FontWeight.w500);
TextStyle ts_14AssistYellowTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(28)), color: kAssistYellowColor);
TextStyle ts_14AssistRedTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(28)), color: kAssistRedColor);
TextStyle ts_14PlaceHolderTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(28)), color: kPlaceHolderColor);
TextStyle ts_14MediumTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(28)), color:  kImportantTitleTextColor, fontWeight: FontWeight.w500);
TextStyle ts_14MediumPlaceHolderTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(28)), color:  kPlaceHolderColor, fontWeight: FontWeight.w500);
TextStyle ts_14BoldPlaceHolderTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(28)), color:  kPlaceHolderColor, fontWeight: FontWeight.bold);
TextStyle ts_14BoldAssistRedTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(28)), color:  kAssistRedColor, fontWeight: FontWeight.bold);
TextStyle ts_14BoldAssistInfoTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(28)), color:  kAssistInfoTextColor, fontWeight: FontWeight.bold);
TextStyle ts_14BoldTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(28)), color:  kImportantTitleTextColor, fontWeight: FontWeight.bold);
TextStyle ts_14BoldNavTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(28)), color:  kNavTitleTextColor, fontWeight: FontWeight.bold);
TextStyle ts_14MediumWhiteTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(28)), color:  Colors.white, fontWeight: FontWeight.w500);
TextStyle ts_14BoldBaseTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(28)), color: kBaseColor,fontWeight: FontWeight.bold);

TextStyle ts_16CommonTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(32)), color: kImportantTitleTextColor);
TextStyle ts_16CommonWhiteTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(32)), color: Colors.white);
TextStyle ts_16CommonBaseTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(32)), color: kBaseColor);
TextStyle ts_16MediumBaseTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(32)),fontWeight: FontWeight.w500, color: kBaseColor);
TextStyle ts_16NormoaLTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(32)), color: kNormoalInfoTextColor);
TextStyle ts_16AssistTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(32)), color: kAssistInfoTextColor);
TextStyle ts_16AssistYellowTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(32)), color: kAssistYellowColor);
TextStyle ts_16AssistRedTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(32)), color: kAssistRedColor);
TextStyle ts_16MediumAssistRedTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(32)),fontWeight: FontWeight.w500, color: kAssistRedColor);
TextStyle ts_16PlaceHolderTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(32)), color: kPlaceHolderColor);
TextStyle ts_16PlaceHolderLightTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(32)), color: kPlaceHolderColor,fontWeight: FontWeight.w300);
TextStyle ts_16MediumPlaceHolderTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(32)), color:  kPlaceHolderColor, fontWeight: FontWeight.w500);
TextStyle ts_16MediumTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(32)), color:  kImportantTitleTextColor, fontWeight: FontWeight.w500);
TextStyle ts_16MediumWhiteTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(32)), color:  Colors.white, fontWeight: FontWeight.w500);
TextStyle ts_16BoldTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(32)), color:  kImportantTitleTextColor, fontWeight: FontWeight.bold);
TextStyle ts_16BoldTextStyleDisabled () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(32)), color:  kAssistInfoTextColor, fontWeight: FontWeight.bold);
TextStyle ts_16BoldWhiteTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(32)), color:  Colors.white, fontWeight: FontWeight.bold);
TextStyle ts_16BoldNavTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(32)), color:  kNavTitleTextColor, fontWeight: FontWeight.bold);
TextStyle ts_16MBoldTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(32)), color:  kImportantTitleTextColor, fontWeight: FontWeight.w600);
TextStyle ts_16MBoldWihteTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(32)), color:  Colors.white, fontWeight: FontWeight.w600);
TextStyle ts_16BaseBoldTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(32)), color:  kBaseColor, fontWeight: FontWeight.bold);

TextStyle ts_18CommonTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(36)), color: kImportantTitleTextColor);
TextStyle ts_18CommonWhiteTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(36)), color: Colors.white);
TextStyle ts_18NormoaLTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(36)), color: kNormoalInfoTextColor);
TextStyle ts_18AssistTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(36)), color: kAssistInfoTextColor);
TextStyle ts_18AssistYellowTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(36)), color: kAssistYellowColor);
TextStyle ts_18AssistRedTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(36)), color: kAssistRedColor);
TextStyle ts_18PlaceHolderTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(36)), color: kPlaceHolderColor);
TextStyle ts_18MediumTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(36)), color:  kImportantTitleTextColor, fontWeight: FontWeight.w500);
TextStyle ts_18BoldTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(36)), color: kImportantTitleTextColor, fontWeight: FontWeight.bold);
TextStyle ts_18BoldBaseTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(36)), color: kBaseColor, fontWeight: FontWeight.bold);
TextStyle ts_18BoldNavTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(36)), color:  kNavTitleTextColor, fontWeight: FontWeight.bold);
TextStyle ts_18BoldRedTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(36)), color: kAssistRedColor,fontWeight: FontWeight.bold);
TextStyle ts_18MboldWihteTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(36)), color: Colors.white, fontWeight: FontWeight.w600);
TextStyle ts_18MboldTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(36)), color: kImportantTitleTextColor, fontWeight: FontWeight.w600);
TextStyle ts_18MAssistTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(36)), color: kAssistInfoTextColor, fontWeight: FontWeight.w600);
TextStyle ts_18MPlaceHolderTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(36)), color: kPlaceHolderColor, fontWeight: FontWeight.w600);

TextStyle ts_20CommonTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(40)), color: kImportantTitleTextColor);
TextStyle ts_20BaseTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(40)), color: kBaseColor);
TextStyle ts_20CommonWhiteTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(40)), color: Colors.white);
TextStyle ts_20MediumTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(40)), color:  kImportantTitleTextColor, fontWeight: FontWeight.w500);
TextStyle ts_20BoldTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(40)), color: kImportantTitleTextColor, fontWeight: FontWeight.bold);
TextStyle ts_20BoldBaseTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(40)), color: kBaseColor, fontWeight: FontWeight.bold);
TextStyle ts_20MediumBaseTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(40)), color:  kBaseColor, fontWeight: FontWeight.w600);
TextStyle ts_20MediumAssistRedTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(40)), color: kAssistRedColor,fontWeight: FontWeight.w500);

// tab标题
TextStyle ts_24MediumTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(48)), color: kImportantTitleTextColor, fontWeight: FontWeight.w500);
TextStyle ts_24BoldTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(48)), color: kImportantTitleTextColor, fontWeight: FontWeight.bold);
TextStyle ts_24BaseBoldTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(48)), color: kBaseColor, fontWeight: FontWeight.bold);
TextStyle ts_24WBoldTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(48)), color: Colors.white, fontWeight: FontWeight.bold);
TextStyle ts_24BoldRedTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(48)), color: kAssistRedColor, fontWeight: FontWeight.bold);

TextStyle ts_25BoldTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(50)), color: kImportantTitleTextColor, fontWeight: FontWeight.bold);
TextStyle ts_26MediumTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(52)), color: kImportantTitleTextColor, fontWeight: FontWeight.w500);

TextStyle ts_28BoldAssistRedTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(56)), color: kAssistRedColor, fontWeight: FontWeight.bold);
TextStyle ts_28BoldBaseTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(56)), color: kBaseColor, fontWeight: FontWeight.bold);
TextStyle ts_28BoldTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(56)), color: kImportantTitleTextColor, fontWeight: FontWeight.bold);
TextStyle ts_28BoldWhiteTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(56)), color: Colors.white, fontWeight: FontWeight.bold);
TextStyle ts_28WhiteTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(56)), color: Colors.white, fontWeight: FontWeight.normal);
TextStyle ts_28MediumBaseTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(56)), color: kBaseColor, fontWeight: FontWeight.w500);

TextStyle ts_30MediumTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(60)), color: kImportantTitleTextColor, fontWeight: FontWeight.w500);
TextStyle ts_30WBoldTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(60)), color: Colors.white, fontWeight: FontWeight.bold);

TextStyle ts_34BoldRedTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(68)), color: kAssistRedColor, fontWeight: FontWeight.w500);

TextStyle ts_36BoldRedTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(72)), color: Colors.white, fontWeight: FontWeight.bold);

TextStyle ts_40BaseBoldTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(80)), color: kBaseColor, fontWeight: FontWeight.bold);
TextStyle ts_40BaseAssistRedTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(80)), color: kAssistRedColor, fontWeight: FontWeight.bold);

TextStyle ts_50WBoldTextStyle () => TextStyle(fontSize: ScreenUtil().setSp(fitFont(100)), color: Colors.white, fontWeight: FontWeight.bold);
