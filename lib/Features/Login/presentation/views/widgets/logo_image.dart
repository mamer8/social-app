import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AssetsData.logo,
        height: 200,
        width: 200,
      ),
    );
  }
}
