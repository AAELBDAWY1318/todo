import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:try_again/size_config.dart';

class LoadingPlaceHolder extends StatelessWidget {
  const LoadingPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig()..init(context);
    return Scaffold(
        body: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    margin:
                        EdgeInsets.only(top: sizeConfig.screenHeight! * 0.1),
                    height: 10.0,
                    width: sizeConfig.screenWidth! * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey[300],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: sizeConfig.screenHeight! * 0.05),
                    height: 20.0,
                    width: sizeConfig.screenWidth! * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey[300],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: sizeConfig.screenWidth! * 0.05),
                    height: sizeConfig.screenHeight! * 0.3,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey[300],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(sizeConfig.screenHeight! * 0.02),
                  height: 10.0,
                  width: sizeConfig.screenWidth! * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.grey[300],
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: sizeConfig.screenWidth! * 0.05),
                    height: sizeConfig.screenHeight! * 0.2,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey[300],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(
                        left: sizeConfig.screenWidth! * 0.05,
                        right: sizeConfig.screenWidth! * 0.05,
                        top: sizeConfig.screenHeight! * 0.04),
                    height: sizeConfig.screenHeight! * 0.06,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey[300],
                    ),
                  ),
                ),
              ],
            )));
  }
}
