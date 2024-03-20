import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phundit_app/gen/assets.gen.dart';

@RoutePage()
class ScreenB extends StatelessWidget {
  const ScreenB({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.pink,
      body: Column(
        children: [
          Center(child: Text("Screen B")),

          Image.asset(Assets.logo.path),

          Assets.logo.image(),

          SvgPicture.asset(Assets.logo1),
        ],
      ),
    );
  }
}
