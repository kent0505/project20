part of 'add_bloc.dart';

abstract class AddEvent {}

class GetIncomesEvent extends AddEvent {}

class AddIncomeEvent extends AddEvent {
  final Income income;
  AddIncomeEvent({required this.income});
}

class EditIncomeEvent extends AddEvent {
  final Income income;
  EditIncomeEvent({required this.income});
}

class DeleteIncomeEvent extends AddEvent {
  final int id;
  DeleteIncomeEvent({required this.id});
}
