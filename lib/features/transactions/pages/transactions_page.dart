import 'package:flutter/material.dart';

import '../../../core/widgets/custom_appbar.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppbar('Transactions'),
      ],
    );
  }
}
