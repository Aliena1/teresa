import 'package:flutter/material.dart';
import 'package:teresa/constants/dimensions/dimensions.dart';
class SkeletonUserDetail extends StatelessWidget {
  const SkeletonUserDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.width18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: Dimensions.width110,
                height: Dimensions.height129,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(
                      Radius.circular(
                          Dimensions.radius8)),
                ),
              ),
              SizedBox(
                width: Dimensions.width25,
              ),
              Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Container(
                    width: Dimensions.width83,
                    height: Dimensions.height19,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: Dimensions.height6,
                  ),
                  Container(
                    width: Dimensions.width83,
                    height: Dimensions.height19,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: Dimensions.height6,
                  ),
                  Container(
                    width: Dimensions.width83,
                    height: Dimensions.height19,
                    color: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: Dimensions.height17,
          ),
        ],
      ),
    );
  }
}
