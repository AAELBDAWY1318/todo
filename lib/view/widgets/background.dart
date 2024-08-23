import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:try_again/constant/app_colors.dart';
import 'package:try_again/size_config.dart';

class Background extends StatelessWidget {
  final double pre;
  const Background({super.key, required this.pre});

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig()..init(context);
    return Column(
      children: [
        Container(
          color: AppColors.primaryColor,
          width: double.infinity,
          height: sizeConfig.screenHeight! * pre,
        ),
        Expanded(
          child: Container(
            color: AppColors.secondaryColor,
            width: double.infinity,
          ),
        ),
      ],
    );
  }
}
