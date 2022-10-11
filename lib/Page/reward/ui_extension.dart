
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UIConstants {
  static double kScreenWidth =  ScreenUtil().screenWidth;
}

/// The pixel density of the design drawing is better than that of the design draft px /pt
const pixelRatio = 2;
extension XKSizeExtension on num {
  ///[ScreenUtil.setWidth]
  double get kW => ScreenUtil().setWidth(this * pixelRatio);

  ///[ScreenUtil.setHeight]
  double get kH => ScreenUtil().setHeight(this * pixelRatio);

  ///[ScreenUtil.radius]
  double get kR => ScreenUtil().radius(this * pixelRatio);

  ///[ScreenUtil.setSp]
  double get kSp => ScreenUtil().setSp(this * pixelRatio);

}

