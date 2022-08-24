import 'package:flutter/material.dart';

import '../../../constants/strings/app_strings.dart';
class NoJobAvailable extends StatelessWidget {
  const NoJobAvailable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/nojob.png"),
        SizedBox(height: 20,),
        const Text(AppStrings.noItemsToDisplay)
      ],
    );
  }
}
