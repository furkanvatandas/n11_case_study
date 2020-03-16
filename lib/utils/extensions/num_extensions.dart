import 'package:flutter_screenutil/flutter_screenutil.dart';

extension NumExtensions on num {
  num setWidth() => ScreenUtil().setWidth(this);

  num setHeight() => ScreenUtil().setHeight(this);
}
