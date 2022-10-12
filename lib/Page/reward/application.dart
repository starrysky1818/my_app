import 'dart:io';
import 'dart:math';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'sp_util.dart';
import 'package:toast/toast.dart';
import 'package:my_app/notifications_manager.dart';

class Application {
  static GlobalKey<NavigatorState> key = GlobalKey();

  static double scaleRatio = 1.0;
  static double scaleX = 1.0;
  static double scaleVX = 1.0;
  static late double screenWidth;
  static late double screenHeight;
  static late  double statusBarHeight;
  static late  double bottomBarHeight;
  static late  double safeTopPadding;
  static late  double safeBottomPadding;
  static late  double safeLefPadding;
  static late  double safeRightPadding;
  static late  double shortestSide;
  static late SpUtil spUtil;

  static initAppSetup() async {
    spUtil = (await SpUtil.getInstance())!;
    await  notification.configureLocalTimeZone();
  }

  // Configure the screen adaptation tool
  static configScreenUtil(BuildContext context)  {
    print("configScreenUtil");
    ToastContext().init(context);
    ScreenUtil.init(context,designSize: Size(750, 1334));
    final size = MediaQuery
        .of(context)
        .size;
    Application.screenWidth = min(size.width,size.height);
    Application.screenHeight = max(size.width,size.height);
    Application.statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;
    Application.bottomBarHeight = MediaQuery
        .of(context)
        .padding
        .bottom;
    Application.safeTopPadding = MediaQuery
        .of(context)
        .padding
        .top;
    Application.safeBottomPadding = MediaQuery
        .of(context)
        .padding
        .bottom;
    Application.safeLefPadding = MediaQuery
        .of(context)
        .padding
        .left;
    Application.safeRightPadding = MediaQuery
        .of(context)
        .padding
        .right;
    Application.scaleRatio = min(1.5, Application.screenWidth / 1024) *  sqrt((1024.0/768.0)/(Application.screenWidth / Application.screenHeight));
    Application.scaleX = min(1.5, Application.screenWidth / 1194);
    Application.scaleVX = min(2, Application.screenHeight / 768);
    Application.shortestSide = MediaQuery.of(context).size.shortestSide;

  }

}

