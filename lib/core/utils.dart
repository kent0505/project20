import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'models/income.dart';

double navBarHeight = 85;

int getCurrentTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}

String formatTimestamp(int timestamp) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  String formattedDate = DateFormat('dd.MM.yyyy').format(date);
  return formattedDate;
}

String formatDateTime(DateTime date) {
  String formattedDate = DateFormat('dd.MM.yyyy').format(date);
  return formattedDate;
}

DateTime convertToDateTime(String date) {
  try {
    return DateFormat('dd.MM.yyyy').parse(date);
  } catch (e) {
    return DateTime.now();
  }
}

String getNowString() {
  DateTime date = DateTime.now();
  String formattedDate = DateFormat('dd.MM.yyyy').format(date);
  return formattedDate;
}

bool getButtonActive(List<TextEditingController> controllers) {
  for (TextEditingController controller in controllers) {
    if (controller.text.isEmpty) return false;
  }
  return true;
}

double getStatusBar(BuildContext context) {
  return MediaQuery.of(context).viewPadding.top;
}

double getBottom(BuildContext context) {
  return MediaQuery.of(context).viewPadding.bottom;
}

void precacheImages(BuildContext context) {
  List<String> imageAssets = [
    'assets/profile.png',
    'assets/onboard1.png',
    'assets/onboard2.png',
    'assets/safe.png',
  ];
  for (String assets in imageAssets) {
    precacheImage(AssetImage(assets), context);
  }
}

String getCategoryAsset(String cat) {
  if (cat == 'Work') return 'assets/cat1.svg';
  if (cat == 'Cash') return 'assets/cat2.svg';
  if (cat == 'Shopping') return 'assets/cat3.svg';
  if (cat == 'Medicine') return 'assets/cat4.svg';
  if (cat == 'Sport') return 'assets/cat5.svg';
  if (cat == 'Travel') return 'assets/cat6.svg';
  return 'assets/cat1.svg';
}

int getAmount(List<Income> incomes, bool isIncome) {
  int incomeAmount = 0;
  int expenseAmount = 0;
  for (Income income in incomes) {
    if (income.isIncome) {
      incomeAmount += income.amount;
    } else {
      expenseAmount += income.amount;
    }
  }
  if (isIncome) return incomeAmount;
  return expenseAmount;
}
