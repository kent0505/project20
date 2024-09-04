import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/texts/text_r.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    super.key,
    required this.income,
    required this.expense,
  });

  final int income;
  final int expense;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Stack(
        children: [
          const Positioned(
            top: 28,
            left: 23,
            child: TextR('Available balance', fontSize: 16),
          ),
          Positioned(
            top: 65,
            left: 23,
            child: TextM('\$${income - expense}', fontSize: 32),
          ),
          Positioned(
            bottom: 18,
            left: 45,
            child: Row(
              children: [
                TextM(
                  'Income \$$income',
                  fontSize: 16,
                  color: AppColors.text2,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 18,
            right: 45,
            child: Row(
              children: [
                TextM(
                  'Expense \$$expense',
                  fontSize: 16,
                  color: AppColors.text2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
