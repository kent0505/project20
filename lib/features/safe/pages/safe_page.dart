import 'package:flutter/material.dart';

import '../../../core/widgets/custom_appbar.dart';

class SafePage extends StatelessWidget {
  const SafePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppbar('Safe'),
      ],
    );
  }
}
