part of 'add_bloc.dart';

abstract class AddState {}

class AddInitial extends AddState {}

class IncomeLoadedState extends AddState {
  final List<Income> incomes;
  final int incomeAmount;
  final int expenseAmount;
  IncomeLoadedState({
    required this.incomes,
    required this.incomeAmount,
    required this.expenseAmount,
  });
}
