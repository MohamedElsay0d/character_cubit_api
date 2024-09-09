import 'package:flutter/material.dart';

import '../../constant/Colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: 80,
      height: 3,
      color: Mycolors.yellow,
    );
  }
}
