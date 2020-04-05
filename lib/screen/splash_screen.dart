import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 320, height: 568, allowFontScaling: true);
    return Container(
      width: MediaQuery.of(context).size.width.w,
      height: MediaQuery.of(context).size.height.w,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/icons/bg_splash_screen.png"),
          fit: BoxFit.cover
        )
      ),
    );
  }
}