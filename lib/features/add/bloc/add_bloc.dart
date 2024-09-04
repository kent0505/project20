import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/db/db.dart';
import '../../../core/models/income.dart';
import '../../../core/utils.dart';

part 'add_event.dart';
part 'add_state.dart';

class AddBloc extends Bloc<AddEvent, AddState> {
  AddBloc() : super(AddInitial()) {
    on<GetIncomesEvent>((event, emit) async {
      if (incomesList.isEmpty) {
        await getIncomes();

        emit(IncomeLoadedState(
          incomes: incomesList,
          incomeAmount: getAmount(incomesList, true),
          expenseAmount: getAmount(incomesList, false),
        ));
      } else {
        emit(IncomeLoadedState(
          incomes: incomesList,
          incomeAmount: getAmount(incomesList, true),
          expenseAmount: getAmount(incomesList, false),
        ));
      }
    });

    on<AddIncomeEvent>((event, emit) async {
      incomesList.add(event.income);
      await updateIncomes();

      emit(IncomeLoadedState(
        incomes: incomesList,
        incomeAmount: getAmount(incomesList, true),
        expenseAmount: getAmount(incomesList, false),
      ));
    });

    on<EditIncomeEvent>((event, emit) async {
      for (Income income in incomesList) {
        if (income.id == event.income.id) {
          income.isIncome = event.income.isIncome;
          income.amount = event.income.amount;
          income.date = event.income.date;
          income.category = event.income.category;
        }
      }
      await updateIncomes();

      emit(IncomeLoadedState(
        incomes: incomesList,
        incomeAmount: getAmount(incomesList, true),
        expenseAmount: getAmount(incomesList, false),
      ));
    });

    on<DeleteIncomeEvent>((event, emit) async {
      incomesList.removeWhere((element) => element.id == event.id);
      await updateIncomes();

      emit(IncomeLoadedState(
        incomes: incomesList,
        incomeAmount: getAmount(incomesList, true),
        expenseAmount: getAmount(incomesList, false),
      ));
    });
  }
}
